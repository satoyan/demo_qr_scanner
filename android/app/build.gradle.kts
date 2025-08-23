plugins {
  id("com.android.application")
  id("kotlin-android")
  // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
  id("dev.flutter.flutter-gradle-plugin")
}

android {
  namespace = "net.satoyan.qr_scanner_demo"
  compileSdk = flutter.compileSdkVersion
  // ndkVersion = flutter.ndkVersion
  ndkVersion = "27.0.12077973"

  compileOptions {
    sourceCompatibility = JavaVersion.VERSION_11
    targetCompatibility = JavaVersion.VERSION_11
  }

  kotlinOptions { jvmTarget = JavaVersion.VERSION_11.toString() }

  defaultConfig {
    applicationId = "net.satoyan.qr_scanner_demo"
    minSdk = flutter.minSdkVersion
    targetSdk = flutter.targetSdkVersion
    versionCode = flutter.versionCode
    versionName = flutter.versionName
  }

  // buildTypes {
  //   getByName("debug"){ }
  //   getByName("release") { }
  //   getByName("profile") { }
  // }

  flavorDimensions += "default"
  var appName = "QR Scanner Demo"
  var flavors = listOf("staging", "production", "dev", "local")

  productFlavors {
    flavors.forEach { flavor ->
      create(flavor) {
        dimension = "default"
        applicationIdSuffix = ".${flavor}"
        resValue(
          type="string",
          name="app_name",
          value = "${appName} ${flavor}"
        )
      }
    }
  }
}

flutter { source = "../.." }
