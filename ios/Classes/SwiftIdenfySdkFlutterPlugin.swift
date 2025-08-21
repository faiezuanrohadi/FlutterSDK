import Flutter
import UIKit
import iDenfySDK
import idenfycore
import idenfyviews

public class SwiftIdenfySdkFlutterPlugin: NSObject, @preconcurrency FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "idenfy_sdk_flutter", binaryMessenger: registrar.messenger())
        let instance = SwiftIdenfySdkFlutterPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    @MainActor public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "getPlatformVersion" {
            result("iOS " + UIDevice.current.systemVersion)
        } else if call.method == "start" {
            if let arguments = call.arguments as? [String: Any],
               let authToken = arguments["authToken"] as? String {

                // //Changing common iDenfy colors
                IdenfyCommonColors.idenfyMainColorV2 = UIColor(hexString: "#61895F")
                IdenfyCommonColors.idenfyMainDarkerColorV2 = UIColor(hexString: "#ACC9AA")
                IdenfyCommonColors.idenfySecondColorV2 = UIColor(hexString: "#191D17")
                // IdenfyCommonColors.idenfyBackgroundColorV2 = UIColor(hexString: "#0A0A0A")
                IdenfyCommonColors.idenfyPhotoResultDetailsCardBackgroundColorV2 = UIColor(hexString: "#61895F")
                IdenfyCommonColors.idenfyGradientColor2V2 = UIColor(hexString: "#ACC9AA")
                IdenfyCommonColors.idenfyStepSuccessColorV2 = UIColor(hexString: "#61895F")

                IdenfyPhotoResultViewUISettingsV2.idenfyPhotoResultViewDetailsCardTitleColor = UIColor(hexString: "#FFFFFF")

                // //Customizing Tooblar
                // IdenfyToolbarUISettingsV2.idenfyDefaultToolbarBackgroundColor = UIColor(hexString: "#0A0A0A")

                // IdenfyCountrySelectionViewUISettingsV2.idenfyCountrySelectionViewCountrySearchBarBackgroundColor = UIColor(hexString: "#0A0A0A")
                // IdenfyCountrySelectionViewUISettingsV2.idenfyCountrySelectionViewCountryTableViewBackgroundColor = UIColor(hexString: "#0A0A0A")
                // IdenfyCountrySelectionViewUISettingsV2.idenfyCountrySelectionViewCountryTableViewBorderColor = UIColor(hexString: "#61895F")
                // IdenfyCountrySelectionViewUISettingsV2.idenfyCountrySelectionViewCountryTableViewCellBackgroundColor = UIColor(hexString: "#0A0A0A")


                // IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewDocumentTableViewBackgroundColor = UIColor(hexString: "#0A0A0A")
                // IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewDocumentTableViewCellBackgroundColor = UIColor(hexString: "#0A0A0A")
                // IdenfyDocumentSelectionViewUISettingsV2.idenfyDocumentSelectionViewDocumentTableViewCellBorderColor = UIColor(hexString: "#61895F")

                //Configuring IdenfyUISettings
                let idenfyUISettingsV2 = IdenfyUIBuilderV2()
                    .withInstructions(IdenfyInstructionsEnum.dialog)
                    .withOnBoadringViewType(IdenfyOnBoardingViewTypeEnum.multipleStatic)
                    .withIdenfyDocumentSelectionType(IdenfyDocumentSelectionTypeEnum.navigateOnContinueButton)
                    .withImmediateRedirect(ImmediateRedirectEnum.none)
                    .build()

                //Configuring IdenfySettings
                let idenfySettingsV2 = IdenfyBuilderV2()
                    .withAuthToken(authToken)
                    .withUISettingsV2(idenfyUISettingsV2)
                    .build()

                //Passsing custom views to the SDK (Every screen has a Viewable, a protocol your custom view must adopt)
                let idenfyViewsV2: IdenfyViewsV2 = IdenfyViewsBuilderV2()
                    // .withSplashScreenV2View(SplashScreenV2View())
                    // .withProviderSelectionView(ProviderSelectionViewV2())
                    // .withProviderCellView(ProviderCell.self)
                    // // .withProviderLoginView(ProviderLoginViewV2())
                    // .withMFAMethodSelectionView(MFAMethodSelectionViewV2())
                    // .withMFAGeneralView(MFAGeneralViewV2())
                    // .withMFACaptchaView(MFACaptchaViewV2())
                    // .withNFCRequiredView(NFCRequiredViewV2())
                    // .withIssuedCountryView(IssuedCountryViewV2())
                    // .withCountrySelectionView(CountrySelectionViewV2())
                    // .withCountryCellView(CountryCell.self)
                    // .withLanguageSelectionView(LanguageSelectionViewV2())
                    // .withLanguageCellView(LanguageCell.self)
                    // .withDocumentSelectionView(DocumentSelectionViewV2())
                    // .withDocumentCellView(DocumentCell.self)
                    // .withConfirmationView(ConfirmationViewV2())
                    // // .withDynamicCameraOnBoardingView(DynamicCameraOnBoardingViewV2())
                    // .withStaticCameraOnBoardingView(StaticCameraOnBoardingViewV2())
                    // .withCameraOnBoardingInstructionDescriptionsCellView(InstructionDescriptionsCellV2.self)
                    // .withConfirmationViewDocumentStepCellView(DocumentStepCell.self)
                    // .withCameraPermissionView(CameraPermissionViewV2())
                    // // .withDrawerContentView(DrawerContentViewV2())
                    // .withUploadPhotoView(UploadPhotoViewV2())
                    // // .withDocumentCameraView(DocumentCameraViewV2())
                    // // .withCameraWithRectangleResultViewV2(DocumentCameraResultViewV2())
                    // .withPdfResultView(PdfResultViewV2())
                    // // .withFaceCameraView(FaceCameraViewV2())
                    // // .withCameraWithoutRectangleResultViewV2(FaceCameraResultViewV2())
                    // .withNFCReadingView(NFCReadingViewV2())
                    // .withNFCReadingTimeOutView(NFCReadingTimeOutViewV2())
                    // .withIdentificationResultsView(IdentificationResultsViewV2())
                    // .withIdentificationResultsStepCellView(ResultsStepCell.self)
                    // .withIdentificationSuccessResultsView(IdentificationSuccessResultsViewV2())
                    // .withIdentificationSuspectedResultsView(IdentificationSuspectedResultsViewV2())
                    // .withManualReviewingStatusWaitingView(ManualReviewingStatusWaitingViewV2())
                    // .withManualReviewingStatusFailedView(ManualReviewingStatusFailedViewV2())
                    // .withManualReviewingStatusApprovedView(ManualReviewingStatusApprovedViewV2())
                    // .withAdditionalSupportView(AdditionalSupportViewV2())
                    // .withFaceAuthenticationSplashScreenV2View(FaceAuthenticationSplashScreenV2View())
                    // .withFaceAuthenticationResultsViewV2(FaceAuthenticationResultsViewV2())
                    .build()

                let idenfyController = IdenfyController.shared
                idenfyController.initializeIdenfySDKV2WithManual(idenfySettingsV2: idenfySettingsV2)
                let idenfyVC = idenfyController.instantiateNavigationController()
                
                UIApplication.shared.keyWindow?.rootViewController?.present(idenfyVC, animated: true, completion: nil)
                
                idenfyController.handleIdenfyCallbacksWithManualResults(idenfyIdentificationResult: {
                    idenfyIdentificationResult
                    in
                    do {
                        let jsonEncoder = JSONEncoder()
                        let jsonData = try jsonEncoder.encode(idenfyIdentificationResult)
                        let string = String(data: jsonData, encoding: String.Encoding.utf8)
                        result(string)
                    } catch {
                    }
                })
            }
        } else if call.method == "startFaceAuth" {
            if let arguments = call.arguments as? [String: Any],
               let withImmediateRedirect = arguments["withImmediateRedirect"] as? Bool,
               let authenticationToken = arguments["token"] as? String {
                let idenfyFaceAuthUISettings = IdenfySettingsDecoder.decodeFaceAuthUISettings(arguments["idenfyFaceAuthUISettings"] as? [String : AnyObject?])
                let idenfyController = IdenfyController.shared
                let faceAuthenticationInitialization = FaceAuthenticationInitialization(authenticationToken: authenticationToken, withImmediateRedirect: withImmediateRedirect, idenfyFaceAuthUISettings: idenfyFaceAuthUISettings)
                idenfyController.initializeFaceAuthentication(faceAuthenticationInitialization: faceAuthenticationInitialization)
                let idenfyVC = idenfyController.instantiateNavigationController()
                
                UIApplication.shared.keyWindow?.rootViewController?.present(idenfyVC, animated: true, completion: nil)
                
                idenfyController.handleIdenfyCallbacksForFaceAuthentication(faceAuthenticationResult: { faceAuthenticationResult in
                    do {
                        let jsonEncoder = JSONEncoder()
                        let jsonData = try jsonEncoder.encode(faceAuthenticationResult)
                        let string = String(data: jsonData, encoding: String.Encoding.utf8)
                        result(string)
                    } catch {
                    }
                })
            }
        }
    }
}
