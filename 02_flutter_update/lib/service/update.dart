class UpdateControl {
  static int getUpgradeRemindLaterTime() {
    /// 从本地读取下次检查更新状态的时间戳
    // var remindDate = StorageUtil().getJSON(STORAGE_USER_Upgrade_Remind_Later);
    var remindDate = 0;
    return remindDate == null ? 0 : remindDate;
  }

  static Future<bool> saveUpgradeRemindLaterTime(int remindDate) {
    /// 保存用户信息
    // StorageUtil().setJSON(STORAGE_USER_Upgrade_Remind_Later, remindDate);
  }
}
