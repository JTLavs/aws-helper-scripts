set -e

while getopts t:r:a:p: flag
do 
    case "${flag}" in
        t) tag=${OPTARG};;
        r) region=${OPTARG};;
        a) account=${OPTARG};;
        p) repository=${OPTARG};;
    esac
done

if  [ -z "$tag" ]
    then echo "No tag specified, Using latest"
fi

if [ -z "$region" ]
    then echo "No region specified. Using eu-west-1"
fi

if [ -z "$account" ]
    then echo "No account id specified, exiting..."
    exit 1
fi

if [ -z "$repsitory"]
    then echo "No repository specified, exiting..."
    exit 1
fi

FULL_TAG=${account}.dkr.ecr.${region:-eu-west-1}.amazonaws.com/${repository}/${tag:-latest}

echo "Building image"
docker build . -t ${FULL_TAG}

echo "Pushing image"
# docker push ${TAG}

