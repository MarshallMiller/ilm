set -e

DATA_DIR=raw_data/arxiv_cs_abstracts
rm -rf ${DATA_DIR}
mkdir -p ${DATA_DIR}
pushd ${DATA_DIR}
wget "https://drive.usercontent.google.com/download?id=1N3MbvpgZAmNgiZgnpXAQFzHrU7Tt3Blb&export=download&authuser=0&confirm=t&uuid=77244138-c164-4a97-818f-9278739bcc47&at=AEz70l50co16NTZJ4L-4BDLasyIF%3A1743480382070" -O arxiv_cs_abstracts.txt.gz
gunzip arxiv_cs_abstracts.txt.gz
sha256sum arxiv_cs_abstracts.txt
popd
