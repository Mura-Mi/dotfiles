// sbt-build-files-watcherを有効化するのに必要
showMessageOnBuildFilesChanged
 
// http://www.scalatest.org/user_guide/using_scalatest_with_sbt
testOptions in Test += Tests.Argument("-oDF")
