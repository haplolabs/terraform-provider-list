# tf-provider-mirror

## What is this repository?

This repository is for maintaining the authoritative list of Providers that will be mirrored, packaged, and transfered to Gatekeeper for installation into Artifactory.

## How is it used?

Upon merge of a PR in this repository, the following process will happen:

* A git webhook will start the automation
* An ECS Fargate task will run `terraform provider mirror` to download provider versions listed in file.
  * The existing provider mirror zip will have its checksum validated
  * It will then be extracted into the container
  * The `terraform provider mirror` process will update versions and JSON metadata
  * The new mirror will be ZIPPED up
  * A new checksum will be created for the updated ZIP
  * Checksum will be stored in a DB
  * Gatekeeper will be called to transfer the provider archive to the necessary locations

## What needs to be done? || project:TFProvider

* [ ] Create provider mirror function  #5affc63d
* [ ] Create checksum validation function  #1b29438f
* [ ] Create zip function  #54615801
* [ ] Create checksum creation function  #a25722cf
* [ ] Create Gatekeeper function  #dab7a901
