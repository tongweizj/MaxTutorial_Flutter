# iOS多线程 Swift4 GCD深入解析

## 必要的概念

### 进程/线程
#### 进程
进程指在系统中能独立运行并作为资源分配的基本单位，它是由一组机器指令、数据和堆栈等组成的，是一个能独立运行的活动实体。


#### 线程
线程是进程的基本执行单元。
一个进程（程序）的所有任务都在线程中执行。

在引入线程的OS中，通常把
* 进程作为资源分配的基本单位，
* 线程作为独立运行和独立调度的基本单位。

### 同步/异步
同步：多个任务情况下，一个任务A执行结束，才可以执行另一个任务B。

异步：多个任务情况下，一个任务A正在执行，同时可以执行另一个任务B。任务B不用等待任务A结束才执行。存在多条线程。

###  并行/并发

并行：指两个或多个事件在同一时刻发生。多核CUP同时开启多条线程供多个任务同时执行，互不干扰。
多条线程同时运行

并发：指两个或多个事件在同一时间间隔内发生。可以在某条线程和其他线程之间反复多次进行上下文切换，看上去就好像一个CPU能够并且执行多个线程一样。其实是伪异步。

### 线程间通信

在1个进程中，线程往往不是孤立存在的，多个线程之间需要经常进行通信
线程间通信的体现：

1个线程传递数据给另1个线程
在1个线程中执行完特定任务后，转到另1个线程继续执行任务

###  多线程概念
多线程是指在软件或硬件上实现多个线程并发执行的技术。

通俗讲就是在同步或异步的情况下，开辟新线程，进行线程间的切换，以及对线程进行合理的调度，做到优化提升程序性能的目的。

#### 多线程的优点

能适当提高程序的执行效率
能适当提高资源利用率（CPU、内存利用率）
避免在处理耗时任务时造成主线程阻塞

#### 多线程的缺点

开启线程需要占用一定的内存空间，如果开启大量的线程，会占用大量的内存空间，降低程序的性能
线程越多，CPU在调度线程上的开销就越大
可能会导致多个线程相互持续等待[死锁]
程序设计更加复杂：比如线程之间的通信、多线程之间的数据竞争

GCD（Grand Central Dispatch）
Dispatch会自动的根据CPU的使用情况，创建线程来执行任务，并且自动的运行到多核上，提高程序的运行效率。对于开发者来说，在GCD层面是没有线程的概念的，只有队列（queue）。任务都是以block的方式提交到队列上，然后GCD会自动的创建线程池去执行这些任务。
GCD的优点：

GCD是苹果公司为多核的并行运算提出的解决方案
GCD会自动利用更多的CPU内核（比如双核、四核）
GCD会自动管理线程的生命周期（创建线程、调度任务、销毁线程）
程序员只需要告诉GCD想要执行什么任务，不需要编写任何线程管理代码

GCD中有两个核心概念
任务 block：执行什么操作
队列 queue：用来存放任务

GCD的使用就两个步骤

定制任务，确定想做的事情
将任务添加到队列中，GCD会自动将队列中的任务取出，放到对应的线程中执行。任务的取出遵循队列的FIFO原则：先进先出，后进后出。

GCD中有两个执行任务的函数


同步执行任务（sync）
dispatch_sync(dispatch_queue_t queue, dispatch_block_t block); 


同步任务会阻塞当前线程，然后把Block中的任务放到指定的队列中执行，只有等到Block中的任务完成后才会让当前线程继续往下运行。


sync是一个强大但是容易被忽视的函数。使用sync，可以方便的进行线程间同步。但是，有一点要注意，sync容易造成死锁。





异步执行任务（async）
dispatch_async(dispatch_queue_t queue, dispatch_block_t block);


异步任务会再开辟一个线程，当前线程继续往下走，新线程去执行block里的任务。



GCD的队列可以分为两大类型


并行队列（Concurrent Dispatch Queue）：

可以让多个任务并发（同时）执行（自动开启多个线程同时执行任务）
并行功能只有在异步（dispatch_async）函数下才有效


放到并行队列的任务，如果是异步执行，GCD也会FIFO的取出来，但不同的是，它取出来一个就会放到别的线程，然后再取出来一个又放到另一个的线程。这样由于取的动作很快，忽略不计，看起来，所有的任务都是一起执行的。不过需要注意，GCD会根据系统资源控制并行的数量，所以如果任务很多，它并不会让所有任务同时执行。





串行队列（Serial Dispatch Queue）：
让任务一个接着一个地执行（一个任务执行完毕后，再执行下一个任务）




同步执行
异步执行




串行队列
当前线程，一个一个执行
其他线程，一个一个执行


并发队列
当前线程，一个一个执行
开很多线程，一起执行





Swift4 GCD 使用
DispatchQueue
最简单的，可以按照以下方式初始化一个队列
//这里的名字能够方便开发者进行Debug
let queue = DispatchQueue(label: "com.geselle.demoQueue")

这样初始化的队列是一个默认配置的队列，也可以显式的指明对列的其他属性
let label = "com.leo.demoQueue"
let qos =  DispatchQoS.default
let attributes = DispatchQueue.Attributes.concurrent
let autoreleaseFrequency = DispatchQueue.AutoreleaseFrequency.never
let queue = DispatchQueue(label: label, qos: qos, attributes: attributes, autoreleaseFrequency: autoreleaseFrequency, target: nil)

这里，我们来一个参数分析他们的作用


label： 队列的标识符，方便调试

qos： 队列的quality of service。用来指明队列的“重要性”，后文会详细讲到。

attributes： 队列的属性。类型是DispatchQueue.Attributes,是一个结构体，遵循了协议OptionSet。意味着你可以这样传入第一个参数[.option1,.option2]。

默认：队列是串行的。

.concurrent：队列为并行的。

.initiallyInactive：则队列任务不会自动执行，需要开发者手动触发。



autoreleaseFrequency： 顾名思义，自动释放频率。有些队列是会在执行完任务后自动释放的，有些比如Timer等是不会自动释放的，是需要手动释放。

队列分类

系统创建的队列

主队列（对应主线程）
全局队列


用户创建的队列

// 获取系统队列
let mainQueue = DispatchQueue.main
let globalQueue = DispatchQueue.global()
let globalQueueWithQos = DispatchQueue.global(qos: .userInitiated)

// 创建串行队列
let serialQueue = DispatchQueue(label: "com.geselle.serialQueue")

// 创建并行队列
let concurrentQueue = DispatchQueue(label: "com.geselle.concurrentQueue",attributes:.concurrent)

// 创建并行队列，并手动触发
let concurrentQueue2 = DispatchQueue(label:"com.geselle.concurrentQueue2", qos: .utility,attributes[.concurrent,.initiallyInactive]) 
//手动触发
if let queue = inactiveQueue {
    queue.activate()
}

suspend / resume
Suspend可以挂起一个线程，就是把这个线程暂停了，它占着资源，但不运行。
Resume可以继续挂起的线程，让这个线程继续执行下去。
concurrentQueue.resume()
concurrentQueue.suspend(）

QoS（quality of service）
QoS的全称是quality of service。在Swift 3中，它是一个结构体，用来制定队列或者任务的重要性。

何为重要性呢？就是当资源有限的时候，优先执行哪些任务。这些优先级包括 CPU 时间，数据 IO 等等，也包括 ipad muiti tasking（两个App同时在前台运行）。

通常使用QoS为以下四种，从上到下优先级依次降低。


User Interactive： 和用户交互相关，比如动画等等优先级最高。比如用户连续拖拽的计算

User Initiated： 需要立刻的结果，比如push一个ViewController之前的数据计算

Utility： 可以执行很长时间，再通知用户结果。比如下载一个文件，给用户下载进度。

Background： 用户不可见，比如在后台存储大量数据

通常，你需要问自己以下几个问题

这个任务是用户可见的吗？
这个任务和用户交互有关吗？
这个任务的执行时间有多少？
这个任务的最终结果和UI有关系吗？

在GCD中，指定QoS有以下两种方式
方式一：创建一个指定QoS的queue
let backgroundQueue = DispatchQueue(label: "com.geselle.backgroundQueue", qos: .background)
backgroundQueue.async {
    //在QoS为background下运行
}

方式二：在提交block的时候，指定QoS
queue.async(qos: .background) {
    //在QoS为background下运行
}

DispatchGroup
DispatchGroup用来管理一组任务的执行，然后监听任务都完成的事件。比如，多个网络请求同时发出去，等网络请求都完成后reload UI。
let group = DispatchGroup()

let queueBook = DispatchQueue(label: "book")
print("start networkTask task 1")
queueBook.async(group: group) {
    sleep(2)
    print("End networkTask task 1")
}
let queueVideo = DispatchQueue(label: "video")
print("start networkTask task 2")
queueVideo.async(group: group) {
    sleep(2)
    print("End networkTask task 2")
}

group.notify(queue: DispatchQueue.main) {
    print("all task done")
}

group.notify会等group里的所有任务全部完成以后才会执行（不管是同步任务还是异步任务）。
Group.enter / Group.leave
/*
 首先写一个函数，模拟异步网络请求
 
 这个函数有三个参数
 * label 表示id
 * cost 表示时间消耗
 * complete 表示任务完成后的回调

 */
public func networkTask(label:String, cost:UInt32, complete:@escaping ()->()){
    print("Start network Task task%@",label)
    DispatchQueue.global().async {
        sleep(cost)
        print("End networkTask task%@",label)
        DispatchQueue.main.async {
            complete()
        }
    }
}

// 我们模拟两个耗时2秒和4秒的网络请求

print("Group created")
let group = DispatchGroup()
group.enter()
networkTask(label: "1", cost: 2, complete: {
    group.leave()
})

group.enter()
networkTask(label: "2", cost: 2, complete: {
    group.leave()
})

group.wait(timeout: .now() + .seconds(4))

group.notify(queue: .main, execute:{
    print("All network is done")
})

Group.wait
DispatchGroup支持阻塞当前线程，等待执行结果。
//在这个点，等待三秒钟
group.wait(timeout:.now() + .seconds(3))

DispatchWorkItem
上文提到的方式，我们都是以block（或者叫闭包）的形式提交任务。DispatchWorkItem则把任务封装成了一个对象。
比如，你可以这么使用
let item = DispatchWorkItem { 
    //任务
}
DispatchQueue.global().async(execute: item)

也可以在初始化的时候指定更多的参数
let item = DispatchWorkItem(qos: .userInitiated, flags: [.enforceQoS,.assignCurrentContext]) { 
    //任务
}

* 第一个参数表示 QoS。
* 第二个参数类型为 DispatchWorkItemFlags。指定这个任务的配饰信息
* 第三个参数则是实际的任务 block


DispatchWorkItemFlags的参数分为两组


执行情况

barrier
detached
assignCurrentContext



QoS覆盖信息

noQoS //没有 QoS
inheritQoS //继承 Queue 的 QoS
enforceQoS //自己的 QoS 覆盖 Queue



after（延迟执行）
GCD可以通过asyncAfter来提交一个延迟执行的任务
比如
let deadline = DispatchTime.now() + 2.0
print("Start")
DispatchQueue.global().asyncAfter(deadline: deadline) { 
    print("End")
}

延迟执行还支持一种模式DispatchWallTime
let walltime = DispatchWallTime.now() + 2.0
print("Start")
DispatchQueue.global().asyncAfter(wallDeadline: walltime) { 
    print("End")
}

这里的区别就是


DispatchTime 的精度是纳秒

DispatchWallTime 的精度是微秒

Synchronization 同步
通常，在多线程同时会对一个变量(比如NSMutableArray)进行读写的时候，我们需要考虑到线程的同步。举个例子：比如线程一在对NSMutableArray进行addObject的时候，线程二如果也想addObject,那么它必须等到线程一执行完毕后才可以执行。
实现这种同步有很多种机制
NSLock 互斥锁
let lock = NSLock()
lock.lock()
//Do something
lock.unlock()

使用锁有一个不好的地方就是：lock和unlock要配对使用，不然极容易锁住线程，没有释放掉。
sync 同步函数
使用GCD，队列同步有另外一种方式- sync，讲属性的访问同步到一个queue上去，就能保证在多线程同时访问的时候，线程安全。
class MyData{
    private var privateData:Int = 0
    private let dataQueue = DispatchQueue(label: "com.leo.dataQueue")
    var data:Int{
        get{
            return dataQueue.sync{ privateData }
        }
        set{
            dataQueue.sync { privateData = newValue}
        }
    }
}

Barrier 线程阻断
假设我们有一个并发的队列用来读写一个数据对象。如果这个队列里的操作是读的，那么可以多个同时进行。如果有写的操作，则必须保证在执行写入操作时，不会有读取操作在执行，必须等待写入完成后才能读取，否则就可能会出现读到的数据不对。这个时候我们会用到 Barrier。
以barrier flag提交的任务能够保证其在并行队列执行的时候，是唯一的一个任务。（只对自己创建的队列有效，对gloablQueue无效）
我们写个例子来看看效果
let concurrentQueue = DispatchQueue(label: "com.leo.concurrent", attributes: .concurrent)
concurrentQueue.async {
    readDataTask(label: "1", cost: 3)
}

concurrentQueue.async {
    readDataTask(label: "2", cost: 3)
}
concurrentQueue.async(flags: .barrier, execute: {
    NSLog("Task from barrier 1 begin")
    sleep(3)
    NSLog("Task from barrier 1 end")
})

concurrentQueue.async {
    readDataTask(label: "2", cost: 3)
}


然后，看到Log
2017-01-06 17:14:19.690 Dispatch[15609:245546] Start data task1
2017-01-06 17:14:19.690 Dispatch[15609:245542] Start data task2
2017-01-06 17:14:22.763 Dispatch[15609:245546] End data task1
2017-01-06 17:14:22.763 Dispatch[15609:245542] End data task2
2017-01-06 17:14:22.764 Dispatch[15609:245546] Task from barrier 1 begin
2017-01-06 17:14:25.839 Dispatch[15609:245546] Task from barrier 1 end
2017-01-06 17:14:25.839 Dispatch[15609:245546] Start data task3
2017-01-06 17:14:28.913 Dispatch[15609:245546] End data task3

执行的效果就是：barrier任务提交后，等待前面所有的任务都完成了才执行自身。barrier任务执行完了后，再执行后续执行的任务。
Semaphore 信号量
DispatchSemaphore是传统计数信号量的封装，用来控制资源被多任务访问的情况。
简单来说，如果我只有两个usb端口，如果来了三个usb请求的话，那么第3个就要等待，等待有一个空出来的时候，第三个请求才会继续执行。
我们来模拟这一情况:
public func usbTask(label:String, cost:UInt32, complete:@escaping ()->()){
    print("Start usb task%@",label)
    sleep(cost)
    print("End usb task%@",label)
    complete()
}

let semaphore = DispatchSemaphore(value: 2)
let queue = DispatchQueue(label: "com.leo.concurrentQueue", qos: .default, attributes: .concurrent)

queue.async {
    semaphore.wait()
    usbTask(label: "1", cost: 2, complete: { 
        semaphore.signal()
    })
}

queue.async {
    semaphore.wait()
    usbTask(label: "2", cost: 2, complete: {
        semaphore.signal()
    })
}

queue.async {
    semaphore.wait()
    usbTask(label: "3", cost: 1, complete: {
        semaphore.signal()
    })
}


log
2017-01-06 15:03:09.264 Dispatch[5711:162205] Start usb task2
2017-01-06 15:03:09.264 Dispatch[5711:162204] Start usb task1
2017-01-06 15:03:11.338 Dispatch[5711:162205] End usb task2
2017-01-06 15:03:11.338 Dispatch[5711:162204] End usb task1
2017-01-06 15:03:11.339 Dispatch[5711:162219] Start usb task3
2017-01-06 15:03:12.411 Dispatch[5711:162219] End usb task3


Tips：在serial queue上使用信号量要注意死锁的问题。感兴趣的同学可以把上述代码的queue改成serial的，看看效果。

作者：一蓑烟羽
链接：https://www.jianshu.com/p/58a4bfb08b5d
來源：简书
简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。