#!/bin/bash
pushd $(dirname `which "$0"`) >/dev/null; fieldhome="$PWD"/..; popd >/dev/null
echo $fieldhome
cd $fieldhome/Resources/


if [[ `defaults read com.openendedgroup.Field use16 | grep -c NO` == "0" ]]
then
    echo "using 1.6"
    VERSION='1.6'
else
    echo "using system 1.8"
    VERSION='1.8'
fi

`/usr/libexec/java_home -v $VERSION`/bin/java -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=128M  -XX:+UseG1GC -Xdock:name=Field -noverify -Xdock:icon=f.icns -Dorg.eclipse.swt.internal.carbon.smallFonts -XstartOnFirstThread -Xmx3g -Dsun.java2d.opengl=True -Djava.library.path=$fieldhome/lib/:$fieldhome/Java/ -Dpython.path=$fieldhome/lib/python/:$fieldhome/python/ -classpath $fieldhome/lib/jna-3.2.4.jar:$fieldhome/core/classes/:$fieldhome/Resources/:$fieldhome/lib/:$fieldhome/lib/swt.jar:$fieldhome/lib/lwjgl.jar:$fieldhome/lib/lwjgl_util.jar:/usr/lib/jvm/java-6-openjdk/lib/tools.jar:$fieldhome/lib/jai_codec.jar:$fieldhome/lib/jai_core.jar:$fieldhome/lib/asm-all-3.2.jar:$fieldhome/lib/itext-2.0.6.jar:$fieldhome/lib/jython-complete.jar:$fieldhome/lib/jruby-complete-1.6.7.2.jar:$fieldhome/lib/parboiled4j-snapshot.jar:$fieldhome/lib/pegdown-0.8.5.4.jar:$fieldhome/lib/qdox-2.0-20100906.201255-1.jar:$fieldhome/lib/writeMethodAPT.jar:$fieldhome/lib/xpp3-1.1.3.4d_b4_min.jar:$fieldhome/lib/xstream-SNAPSHOT.jar:$fieldhome/Java/:$fieldhome/lib/batik-all.jar:$fieldhome/extras/bin/gstreamer/gstreamer-java.jar:$fieldhome/extras/bin/gstreamer/jna.jar:$fieldhome/extras/bin/gstreamer/ -Dtrampoline.class=field.bytecode.protect.StandardTrampoline -Dpython.security.respectJavaAccessibility=false -Dmain.class=field.Blank2 field.launch.Launcher -extensions.dir $fieldhome/extensions/  ${*}
