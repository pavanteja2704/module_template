#!/bin/sh


case $1 in

#............................................................ lz-org ...........................................................#

    lz-org)
    cd lz-org/template/

    #........................... Setting up the required project.......................#
    PROJECT_ID="my-project-amit1-415215"
    gcloud config set project $PROJECT_ID
   
    export TF_LOG=INFO 
    export TF_LOG_PATH="../log-file/lz-org-$(date +"%d-%m-%Y_%H:%M").log"
   
    echo -e "----------------------------------------------------------------------------------------------------------"
    echo -e "----------------------------------------------------------------------------------------------------------"
    echo -e "Terraform Initialization Started, Please wait......!!!!"
    terraform init -upgrade
    echo -e "----------------------------------------------------------------------------------------------------------"
    echo -e "----------------------------------------------------------------------------------------------------------"
    echo -e "Generating Oauth Access Token..!!!!"
    export MYTOKEN=$(gcloud auth print-access-token)
    echo -e "\n"
    echo -e "Terraform Destroy is going to start, Please wait......!!!!"
    echo -e "\n"
    read -p "Your infrastructure is getting destroyed. Are you Sure ? y or n: " ans
    echo -e "Answer: $ans"
    if [ $ans == "y" ]
    then
        JSON_FILE_1="../input-json-file/folders.tfvars"
        JSON_FILE_2="../input-json-file/projects.tfvars"
        JSON_FILE_3="../input-json-file/policy.tfvars"
        JSON_FILE_4="../input-json-file/budget.tfvars"
        JSON_FILE_5="../input-json-file/api.tfvars"
        JSON_FILE_6="../input-json-file/host-svc.tfvars"

        terraform destroy \
        -var access_token=$MYTOKEN \
        -var-file=$JSON_FILE_1 \
        -var-file=$JSON_FILE_2 \
        -var-file=$JSON_FILE_3 \
        -var-file=$JSON_FILE_4 \
        -var-file=$JSON_FILE_5 \
        -var-file=$JSON_FILE_6 

        echo -e "----------------------------------------------------------------------------------------------------------"
        echo -e "----------------------------------------------------------------------------------------------------------"
    else
        echo -e "Answer is 'n', Hence, exiting."
    fi
    ;;
