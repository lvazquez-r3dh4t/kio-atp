24 The upgrade policy can be replaced
==============================================================

# Web way
* The first step will be accessing the platform, with the assigned credentials:
![login](https://user-images.githubusercontent.com/40834435/42892147-b638bc28-8a76-11e8-98d9-ea1249a5d128.jpg)

* Create the project
![project_new](https://raw.githubusercontent.com/arceojaviere/atp-amx/master/green/23_Supports_the_rolling_upgrade_policy/images/screenshot-console.amx.openshift-lab.com%208443-2018-07-18-13-11-51.png?token=ANHQQC8tOgxWNTgFqqOvxMd0pCYhHYbDks5bWODEwA%3D%3D)

* Create the project details
![project_info](https://raw.githubusercontent.com/arceojaviere/atp-amx/master/green/23_Supports_the_rolling_upgrade_policy/images/screenshot-console.amx.openshift-lab.com%208443-2018-07-18-13-15-30.png?token=ANHQQOpPKl0i7H-TPQP47xt7rwHExhIeks5bWOE5wA%3D%3D)

* Deploy image from registry
![deploy_image](https://raw.githubusercontent.com/arceojaviere/atp-amx/master/green/23_Supports_the_rolling_upgrade_policy/images/screenshot-console.amx.openshift-lab.com%208443-2018-07-18-13-16-50.png?token=ANHQQJpRDTLhzRj4EH93aMN_k45LE4HAks5bWOGOwA%3D%3D)

* Select correct image
![select_image](https://raw.githubusercontent.com/arceojaviere/atp-amx/master/green/23_Supports_the_rolling_upgrade_policy/images/screenshot-console.amx.openshift-lab.com%208443-2018-07-18-13-18-51.png?token=ANHQQILiWvQbR537d5xzY_pwwemco1XSks5bWOHnwA%3D%3D)

* Verify successfully Deployment
![successfull_deployment](https://raw.githubusercontent.com/arceojaviere/atp-amx/master/green/23_Supports_the_rolling_upgrade_policy/images/screenshot-console.amx.openshift-lab.com%208443-2018-07-18-13-19-52.png?token=ANHQQFFVb-2NZphTJsVWJLAcgoBEyTU4ks5bWOLjwA%3D%3D)

*Click on actions and edit YAML
![edit yaml](https://user-images.githubusercontent.com/40834435/43011984-b44fc056-8c0a-11e8-86a3-d2614ea71ab1.JPG)

*We modify in the strategy line the type part we modify it by recreate and we save
![recreate](https://user-images.githubusercontent.com/40834435/43014350-871ed8a4-8c11-11e8-934d-664be2e734dd.JPG)

*We apply the deploy manually if it is not done automatically by clicking on deploy
![deploy manual](https://user-images.githubusercontent.com/40834435/43014355-8aced8f0-8c11-11e8-9a08-92907850e848.JPG)

*We validate that you are doing the deploy
![deploy2](https://user-images.githubusercontent.com/40834435/43014531-0aa8e6ba-8c12-11e8-9aab-981e970f42ce.JPG)






