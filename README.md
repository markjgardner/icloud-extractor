# icloud-extractor
An attempt at extracting photos and documents from icloud to onedrive

### Based on
* [icloud_photos_downloader](https://github.com/icloud-photos-downloader/icloud_photos_downloader)
* [onedrive for linux](https://github.com/abraunegg/onedrive)

## Model
### iCloud
Creates a single pod (icloudlogin) to handle initial login and 2fa to icloud. The cookie is persisted to a PV which is shared between the login pod and the CronJob which runs the actual download task. The icloud session expires after 2 months forcing the user to manually login again at that point. 

**TODO**: add an alert to notify the user that the session is expired.

The cronjob runs both icloudpd and onedrive. icloudpd downloads all photos to a shared data PV. Onedrive monitors the shared volume and uploads the photos.