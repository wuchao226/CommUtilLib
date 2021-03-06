## 基于 Kotlin 以及 AndroidX 封装的一个常用的工具库

### 1. 当前版本：`0.1.0`

### 2. 使用步骤：

```groovy
// 1. root build.gradle
allprojects {
    repositories {
        ...
        maven { url 'https://jitpack.io' }
    }
}

// 2. dependency
dependencies {
    implementation "com.github.ibelieve-mm:CommUtilLib:{版本号}"
}
```

---

### lib  已经依赖的三方库（使用时需要排除）

1. 基本组件

```groovy
constraintLayout      : "androidx.constraintlayout:constraintlayout:${depsVersion.constraintLayout}",
recyclerView          : "androidx.recyclerview:recyclerview:${depsVersion.recyclerView}",
```

2. 网络框架

```groovy
retrofit              : "com.squareup.retrofit2:retrofit:${depsVersion.retrofit2}",
retrofitConvertGson   : "com.squareup.retrofit2:converter-gson:${depsVersion.retrofit2}",
retrofitAdapterRxjava2: "com.squareup.retrofit2:adapter-rxjava2:${depsVersion.retrofit2}",
okhttp3Logging        : "com.squareup.okhttp3:logging-interceptor:${depsVersion.okhttp3Logging}",
```

3. QMUI

```groovy
qmui                  : "com.qmuiteam:qmui:${depsVersion.qmui}",
qmuiArch              : "com.qmuiteam:arch:${depsVersion.qmui}",
qmuiArchCompiler      : "com.qmuiteam:arch-compiler:${depsVersion.qmui}",
```

4. lifecycle

```groovy
lifecycleExtensions   : "android.arch.lifecycle:extensions:${depsVersion.lifecycleExtensions}",
```



---

### 关于 Proguard

#### 1. 打包时删除 log 日志

```proguard
### --- start: 去除自定义的 Log 日志 ---------------------------------------------------------
-assumenosideeffects class mm.chenme.lib.commutillib.utils.* {
    # mm.chenme.lib.commutillib.utils.LogUtil
    *** loge(...);
    *** logw(...);
    *** logd(...);
    *** logi(...);
    *** logd(...);
}
### --- end: 去除自定义的 Log 日志 -----------------------------------------------------------
```

---

### 历史版本

#### 0.0.1.1 预览版
> 1. 扩展 Date(日期)类 的方法；
> 2. 加入自定义 Log 工具；

#### 0.1.0 预览版

> 1. 加入网络请求；
> 2. 使用了 `lifecycle`；
> 3. 引入了[ `QMUI`](https://qmuiteam.com/android);
> 4. `BaseActivity` 继承自 `QMUIFragmentActivity`；
> 5. 提供了网络请求 Demo；