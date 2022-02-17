# icloud-extractor
An attempt at extracting photos and documents from icloud to onedrive

## Based on
* [icloud_photos_downloader](https://github.com/icloud-photos-downloader/icloud_photos_downloader)
* [onedrive for linux](https://github.com/abraunegg/onedrive)

## How it works
Creates a single pod (icloudlogin) to handle initial login and 2fa to icloud. The cookie is persisted to a PV which is shared between the login pod and the CronJob which runs the actual download task. The icloud session expires after 2 months forcing the user to manually login again at that point. 

**TODO**: add an alert to notify the user that the session is expired.

Similarly, a single pod is created to handle login for onedrive. The resulting session is persisted to a PV. This session is good forever so this pod only has to be created and interacted with once.

The cronjob runs both icloudpd and onedrive. icloudpd downloads all photos to a shared volume. Onedrive monitors the shared volume and uploads the photos.

```bash
# Edit 1-secrets.yaml
./deploy.sh
# login to icloud
# login to onedrive
# cronjob will run 1st of each month
```