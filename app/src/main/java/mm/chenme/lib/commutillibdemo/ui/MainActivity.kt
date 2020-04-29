package mm.chenme.lib.commutillibdemo.ui

import android.os.Bundle
import com.qmuiteam.qmui.arch.QMUIFragmentActivity
import com.qmuiteam.qmui.util.QMUIStatusBarHelper
import mm.chenme.lib.commutillibdemo.R

class MainActivity : QMUIFragmentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // 设置状态栏黑色字体
        QMUIStatusBarHelper.setStatusBarLightMode(this)
    }
}
