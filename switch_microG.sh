#!/bin/bash

switch_branches() {
  TOPDIR=$PWD
  cd $2
  echo "-"
  echo "$PWD"
  git checkout $1
  cd $TOPDIR
}

switch_zpatch() {
  TOPDIR=$PWD
  cd z_patches
  echo "-"
  echo "$PWD"
  case "$2" in 
    R) ./patches_reverse.sh
       git checkout $1
       ;;
    S) ./patches_apply.sh  
       ;;
  esac
  cd $TOPDIR
}

case "$1" in
  microG) 
     BRANCH1="cm-14.1-microG"
     BRANCH2="cm-14.1"
     BRANCH3="cm-14.1-microG"
    ;;

  oms) 
    BRANCH1="cm-14.1-mG-oms"
    BRANCH2="cm-14.1-oms"
    BRANCH3="cm-14.1-microG"    
   ;;

  default) 
    BRANCH1="cm-14.1"
    BRANCH2="cm-14.1"  
    BRANCH3="cm-14.1"
   ;;

  *) 
    echo "usage: switch_microg default|microG|oms"
    exit
   ;;   
esac

switch_zpatch $BRANCH1 R

switch_branches $BRANCH3 external/sqlite
switch_branches $BRANCH1 frameworks/base
switch_branches $BRANCH1 frameworks/native
switch_branches $BRANCH1 packages/apps/Settings
switch_branches $BRANCH3 packages/apps/SetupWizard
switch_branches $BRANCH1 system/sepolicy
switch_branches $BRANCH1 vendor/cm
switch_branches $BRANCH1 .repo/local_manifests

switch_branches $BRANCH2 packages/apps/Contacts
switch_branches $BRANCH2 packages/apps/ContactsCommon
switch_branches $BRANCH2 packages/apps/Dialer
switch_branches $BRANCH2 packages/apps/ExactCalculator
switch_branches $BRANCH2 packages/apps/PackageInstaller
switch_branches $BRANCH2 packages/apps/PhoneCommon

switch_zpatch $BRANCH1 S

