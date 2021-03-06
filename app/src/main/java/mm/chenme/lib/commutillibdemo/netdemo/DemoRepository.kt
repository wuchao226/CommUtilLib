package mm.chenme.lib.commutillibdemo.netdemo

import androidx.lifecycle.MutableLiveData
import mm.cme.commnetlib.RetrofitClient
import mm.cme.commnetlib.impl.DefaultCallback
import mm.cme.commnetlib.resp.BaseResponse

/**
 * Descriptions：
 * StartVersion：
 * <p>
 * Author：ChenME
 * Date：2020/5/29
 * Email：ibelieve1210@163.com
 */
class DemoRepository {

    private val mApi = RetrofitClient.build().create(DemoApi::class.java)

    fun queryWeather(): MutableLiveData<BaseResponse<Weather?>> {
        val respLiveData = MutableLiveData<BaseResponse<Weather?>>()
        mApi.queryWeather().enqueue(DefaultCallback(respLiveData))
        return respLiveData
    }
}

