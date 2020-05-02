package mm.chenme.lib.commutillibdemo.ui

import com.qmuiteam.qmui.kotlin.onClick
import kotlinx.android.synthetic.main.activity_qmui_widget_test.*
import mm.chenme.lib.commutillib.exts.stoast
import mm.chenme.lib.commutillib.utils.loge
import mm.chenme.lib.commutillibdemo.R
import mm.chenme.lib.commutillibdemo.base.BaseFragmentActivity
import mm.chenme.lib.commutillibdemo.utils.addQMUIBtnAlpha

/**
 * Descriptions：QMUI 控件测试
 * <p>
 * Author：ChenME
 * Date：2020/5/2
 * Email：ibelieve1210@163.com
 */
class QMUIWidgetTestActivity : BaseFragmentActivity() {

    override fun loadContentView(): Int = R.layout.activity_qmui_widget_test

    override fun initView() {

        topbar.setTitle("QMUI 控件测试")
        topbar.setSubTitle("这里是副标题")
        topbar.addLeftBackImageButton().onClick {
            finish()
        }

        addQMUIBtnAlpha(btn_printLog, qmBtn_cannotUse, qmBtn_showToast, qmBtn_noEvent)
    }

    override fun initListener() {
        btn_printLog.onClick {
            loge("打印 log 日志！")
        }

        qmBtn_showToast.onClick {
            stoast("弹出 toast！")
        }
    }
}