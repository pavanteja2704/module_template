#!/bin/sh

case $1 in
#............................................................ lz-storage_bucket ...........................................................#

    lz-storage_bucket)
    cd lz-storage_bucket/template/

    PROJECT_ID="hardy-binder-411706"
    gcloud config set project $PROJECT_ID

    export TF_LOG=INFO 
    export TF_LOG_PATH="../log-file/lz-storage_bucket-$(date +"%d-%m-%Y_%H:%M").log"
   
    echo -e "----------------------------------------------------------------------------------------------------------"
    echo -e "----------------------------------------------------------------------------------------------------------"
    echo -e "Terraform Initialization Started, Please wait......!!!!"
    terraform init -upgrade 
    echo -e "----------------------------------------------------------------------------------------------------------"
    echo -e "----------------------------------------------------------------------------------------------------------"

    echo -e "Generating Oauth Access Token..!!!!"
    export MYTOKEN=$(gcloud auth print-access-token)

    echo -e "----------------------------------------------------------------------------------------------------------"
    echo -e "----------------------------------------------------------------------------------------------------------"
    echo -e "Terraform Plan Initiated, Please wait......!!!!"

    JSON_FILE_1="../input-json-file/storage_bucket.tfvars"

    PLAN_FILE="../plan-file/storage_bucket-tf-plan.json"
    
    terraform plan \
    -var access_token=$MYTOKEN \
    -var-file=$JSON_FILE_1 \
    -out=$PLAN_FILE

    echo -e "\n"
    echo -e "----------------------------------------------------------------------------------------------------------"
    echo -e "----------------------------------------------------------------------------------------------------------"

    echo -e "Terraform Apply is going to start, Please wait......!!!!"
    echo -e "\n"
    read -p "Your infrastructure is getting changed. Are you Sure ? y or n: " ans
    echo -e "Answer: $ans"
    if [ $ans == "y" ]
    then
        terraform apply $PLAN_FILE
        echo -e "----------------------------------------------------------------------------------------------------------"
        echo -e "----------------------------------------------------------------------------------------------------------"

        read -p "You have changed your code repository. Do you want to push these changes to remote repo ? y or n: " ans
        echo -e "Answer: $ans"
        if [ $ans == "y" ]
        then
            
            cd ../../
            git add .
            read -p "Please provide comment for this commit (what you added/changed ?) : " comment
            echo -e "$Comment: $comment"
            git commit -m "$comment"
            git push origin master

            echo -e "....Master branch has been updated.....!!!"
            echo -e "----------------------------------------------------------------------------------------------------------"

        else 
            echo -e "Answer is 'n', Hence, push code changes cancel."
        fi


    else
        echo -e "Answer is 'n', Hence, exiting."
    fi
    ;;