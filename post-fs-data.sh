#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR ${0%/*}
# This script will be executed in post-fs-data mode
# More info in the main Magisk thread
#=======================================#
#VARIABLES===============================#
LOGPOST=/data/media/0/.mkadppost.log
CPUS=`grep -c processor /proc/cpuinfo`
#=======================================#
#=======================================#

rm $LOGPOST
kmsglog() {
	echo -e "[*] $@" >> $LOGPOST
}

kmsglog $(date) 
kmsglog "MKADP-1 Prop Running"
kmsglog "----"
#
#MKADP-1 ButterLimits
#
setprop dalvik.vm.dex2oat-swap true
setprop dalvik.vm.gc.overwritefree true
setprop wifi.supplicant_scan_interval 360
setprop ADRENO_PROFILER_ENABLE_OPENCL 1
setprop ro.ril.set.mtu1472 1
setprop ro.mot.eri.losalert.delay 2000
setprop persist.cust.tel.eons 1
setprop ro.config.hw_fast_dormancy 1
setprop ro.ril.gprsclass 10
setprop ro.ril.hsdpa.category 8
setprop ro.ril.hsupa.category 6
setprop ro.ril.hsxpa 2
#
setprop vendor.perf.gestureflingboost.enable true
setprop vendor.iop.enable_iop 1
setprop vendor.iop.enable_uxe 0
setprop vendor.perf.iop_v3.enable 1
setprop vendor.perf.iop_v3.enable.debug 0
setprop vendor.enable.prefetch 1
setprop vendor.iop.enable_prefetch_ofr 1
setprop ro.hwui.patch_cache_size 384
setprop ro.hwui.drop_shadow_cache_size 18
setprop ro.hwui.layer_cache_size 90
setprop ro.hwui.path_cache_size 36
setprop ro.hwui.r_buffer_cache_size 18
setprop ro.hwui.texture_cache_size 183
setprop ro.surface_flinger.max_frame_buffer_acquired_buffers 3
setprop debug.gr.numframebuffers 3
setprop debug.qctwa.preservebuf 1
setprop dev.pm.dyn_samplingrate 1
setprop debug.sf.disable_backpressure 1
setprop debug.composition.type c2d
setprop persist.sys.composition.type c2d
setprop debug.egl.hw 1
setprop debug.enabletr true
setprop debug.overlayui.enable 1
setprop debug.performance.tuning 1
setprop ro.sf.compbypass.enable 0
setprop libc.debug.malloc 0
setprop debug.gr.swapinterval -60
setprop debug.hwui.renderer skiagl
setprop debug.egl.swapinterval -60
setprop vendor.debug.egl.swapinterval -60
setprop debug.sf.latch_unsignaled 1
setprop debug.egl.buffcount 4
setprop ro.sf.disable_triple_buffer 0
setprop net.tcp.2g_init_rwnd 10
setprop net.tcp.default_init_rwnd 60
setprop net.tethering.noprovisioning true
setprop hwui.disable_vsync true
setprop debug.sf.recomputecrop 0
setprop debug.cpurend.vsync false
setprop hwui.render_dirty_regions false
#
setprop dalvik.vm.heapstartsize 16m
#
#Some lines will be repeating below with above with different values
#They are repeating for a cause, don't delete any - ButterLimits
#
kmsglog $(date) 
kmsglog "MKADP-2 Prop Running"
kmsglog "----"
#
#MKADP-2 ButterLimits
#
setprop ro.FOREGROUND_APP_MEM 1280
setprop ro.VISIBLE_APP_MEM 2560
setprop ro.PERCEPTIBLE_APP_MEM 3840
setprop ro.HEAVY_WEIGHT_APP_MEM 6400
setprop ro.SECONDARY_SERVER_MEM 7680
setprop ro.BACKUP_APP_MEM 8960
setprop ro.HOME_APP_MEM 2048
setprop ro.HIDDEN_APP_MEM 12800
setprop ro.CONTENT_PROVIDER_MEM 15360
setprop ro.EMPTY_APP_MEM 20480
# END OOM_MEM_Settings
# BEGIN OOM_ADJ_Settings
setprop ro.FOREGROUND_APP_ADJ 0
setprop ro.VISIBLE_APP_ADJ 1
setprop ro.PERCEPTIBLE_APP_ADJ 2
setprop ro.HEAVY_WEIGHT_APP_ADJ 4
setprop ro.SECONDARY_SERVER_ADJ 5
setprop ro.BACKUP_APP_ADJ 6
setprop ro.HOME_APP_ADJ 1
setprop ro.HIDDEN_APP_MIN_ADJ 7
setprop ro.EMPTY_APP_ADJ 15
#
setprop persist.sys.use_dithering 1
#RAM Tweak
setprop ro.HOME_APP_ADJ 1
#
#Fast Boot
setprop ro.config.hw_quickpoweron true
#
#Improved A/V Recording Quality Tweak
setprop ro.media.enc.jpeg.quality 100
setprop ro.media.dec.jpeg.memcap 8000000
setprop ro.media.enc.hprof.vid.bps 8000000
setprop ro.media.capture.maxres 8m
setprop ro.media.panorama.defres 3264×1840
setprop ro.media.panorama.frameres 1280×720
setprop ro.camcorder.videoModes true
setprop ro.media.enc.hprof.vid.fps 65
#
#Camera2API
setprop persist.camera.HAL3.enabled 1
#
#Improve Gaming
setprop persist.sys.NV_FPSLIMIT 60
setprop persist.sys.NV_POWERMODE 1
setprop persist.sys.NV_PROFVER 15
setprop persist.sys.NV_STEREOCTRL 0
setprop persist.sys.NV_STEREOSEPCHG 0
setprop persist.sys.NV_STEREOSEP 20
setprop persist.sys.purgeable_assets 1
#
#Signal Tweaks
setprop ro.ril.hep 0
setprop ro.ril.hsxpa 2
setprop ro.ril.gprsclass 12
setprop ro.ril.enable.dtm 1
setprop ro.ril.hsdpa.category 8
setprop ro.ril.enable.a53 1
setprop ro.ril.enable.3g.prefix 1
setprop ro.ril.htcmaskw1.bitmask 4294967295
setprop ro.ril.htcmaskw1 14449
setprop ro.ril.hsupa.category 6
setprop persist.cust.tel.eons 1
setprop ro.config.hw_fast_dormancy 1
#
#Support for ipv4 and ipv6
setprop persist.telephony.support.ipv6 1
setprop persist.telephony.support.ipv4 1
#
#Internet Speed Tweaks
setprop net.tcp.buffersize.default 4096,87380,256960,4096,16384,256960
setprop net.tcp.buffersize.wifi 4096,87380,256960,4096,16384,256960
setprop net.tcp.buffersize.umts 4096,87380,256960,4096,16384,256960
setprop net.tcp.buffersize.gprs 4096,87380,256960,4096,16384,256960
setprop net.tcp.buffersize.edge 4096,87380,256960,4096,16384,256960
#
#Makes streaming videos stream faster
setprop media.stagefright.enable-player true
setprop media.stagefright.enable-meta true
setprop media.stagefright.enable-scan true
setprop media.stagefright.enable-http true
setprop media.stagefright.enable-rtsp true
setprop media.stagefright.enable-record false
#
#Graphics Enhancement
setprop video.accelerate.hw 1
setprop ro.media.dec.jpeg.memcap 8000000
setprop ro.media.enc.hprof.vid.bps 8000000
setprop ro.media.enc.jpeg.quality 100
#
#Scroll and touch Response Tweak
#AddOn6-2+
#setprop windowsmgr.max_events_per_sec 240
#end
setprop ro.min_pointer_dur 8
ro.max.fling_velocity 12000
setprop ro.min.fling_velocity 8000
setprop ro.hwui.text_small_cache_width 2048
setprop ro.hwui.text_small_cache_height 4096
setprop persist.sys.scrollingcache 4
setprop touch.pressure.scale 0
#AddOn40
setprop touch.orientationAware 0
setprop touch.size.calibration geometric
setprop touch.size.scale 1
setprop touch.size.bias 0
setprop touch.size.isSummed 0
setprop touch.toolSize.isSummed 0
setprop touch.toolSize.areaScale 22
setprop touch.orientation.calibration interpolated 
setprop touch.distance.calibration area
setprop touch.distance.scale 0
setprop touch.coverage.calibration box
setprop touch.gestureMode spots
setprop touch.pressure.calibration amplitude
setprop touch.deviceType touchScreen
setprop persist.sys.ui.hw 1
setprop persist.device_config.runtime_native.usap_pool_enabled true
setprop persist.dev.pm.dyn_samplingrate 1
setprop persist.vendor.qti.inputopts.enable true
setprop persist.vendor.qti.inputopts.movetouchslop 0.1
setprop MultitouchMinDistance 1px
setprop MultitouchSettleInterval 0.1ms
setprop SurfaceOrientation 0
setprop TapInterval 0.1ms
setprop TapDragInterval 0.1ms
setprop QuietInterval 0.1ms
setprop MovementSpeedRatio 0.3
setprop TapSlop 1px
setprop view.scroll_friction 0
setprop pm.dexopt.bg-dexopt speed-profile
setprop pm.dexopt.shared speed
#
#Disables data sent and logging
setprop ro.config.nocheckin 1
setprop ro.kernel.checkjni 0
setprop ro.kernel.android.checkjni 0
setprop profiler.force_disable_err_rpt 1
setprop profiler.force_disable_ulog 1
#
#Power Saving Tweaks
setprop wifi.supplicant_scan_interval 180
setprop ro.ril.disable.power.collapse 0
setprop pm.sleep_mode 1
#
#Dialing and Call Tweaks
setprop ro.telephony.call_ring.delay 0
setprop ring.delay 0
setprop ro.lge.proximity.delay 25
setprop mot.proximity.delay 25
setprop ro.ril.enable.amr.wideband 1
#
#Dalvik VM Tweaks
setprop dalvik.vm.checkjni false
setprop dalvik.vm.dexopt-data-only 1
setprop dalvik.vm.heapstartsize 5m
setprop dalvik.vm.heapgrowthlimit 48m
setprop dalvik.vm.verify-bytecode false
setprop dalvik.vm.execution-mode int:jit
setprop dalvik.vm.lockprof.threshold 250
setprop dalvik.vm.dexopt-flags m=v,o=y
setprop dalvik.vm.stack-trace-file /data/anr/traces.txt
#setprop dalvik.vm.jmiopts forcecopy
#
kmsglog $(date) 
kmsglog "MKADP Prop Done"
kmsglog "----"
#
kmsglog $(date) 
kmsglog "Optimizing system"
kmsglog "----"
cmd package bg-dexopt-job

kmsglog $(date) 
kmsglog "Filesystem tweaks done"
kmsglog "----"
dumpsys deviceidle whitelist +com.mkadp.blapptwo
kmsglog $(date) 
kmsglog "Post Done"
kmsglog "----"
#
