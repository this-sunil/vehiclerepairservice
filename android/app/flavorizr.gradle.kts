import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("app")

    productFlavors {
        create("development") {
            dimension = "app"
            applicationId = "com.brand.vehiclerepairservice.dev"
            resValue(type = "string", name = "app_name", value = "Vehicle Repair Service Dev")
        }
        create("staging") {
            dimension = "app"
            applicationId = "com.brand.vehiclerepairservice.staging"
            resValue(type = "string", name = "app_name", value = "Vehicle Repair Service Staging")
        }
        create("production") {
            dimension = "app"
            applicationId = "com.brand.vehiclerepairservice"
            resValue(type = "string", name = "app_name", value = "Vehicle Repair Service")
        }
    }

    buildFeatures.resValues = true
}