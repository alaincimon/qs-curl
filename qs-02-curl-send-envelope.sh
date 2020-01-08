# Send a signing request via email
#
# Check that we're in a bash shell
if [[ $SHELL != *"bash"* ]]; then
  echo "PROBLEM: Run these scripts from within the bash shell."
fi

# Settings
# Fill in these constants
#
# Obtain an OAuth access token from https://developers.docusign.com/oauth-token-generator
accessToken='{ACCESS_TOKEN}'
# Obtain your accountId from demo.docusign.com -- the account id is shown in the drop down on the
# upper right corner of the screen by your picture or the default picture. 
accountId='{ACCOUNT_ID}'
# Recipient Information:
signerName='{USER_FULLNAME}'
signerEmail='{USER_EMAIL}'
# The document you wish to send. Path is relative to the root directory of this repo.
fileNamePath='demo_documents/World_Wide_Corp_lorem.pdf'

# The API base_path
basePath='https://demo.docusign.net/restapi'

#
# Step 1. Create the envelope request body.
#         One signHere tab is added.

# temp files:
request_data=$(mktemp /tmp/request-eg-001.XXXXXX)
response=$(mktemp /tmp/response-eg-001.XXXXXX)
doc1_base64=$(mktemp /tmp/eg-001-doc1.XXXXXX)

echo ""
echo "Sending the envelope request to DocuSign..."

# Fetch doc and encode
cat $fileNamePath | base64 > $doc1_base64
# Concatenate the different parts of the request
printf \
'{
    "emailSubject": "Please sign this document",
    "documents": [
        {
            "documentBase64": "' > $request_data
             cat $doc1_base64 >> $request_data
             printf '",
            "name": "Lorem Ipsum",
            "fileExtension": "pdf",
            "documentId": "1"
        }
    ],
    "recipients": {
        "signers": [
            {
                "email": "' >> $request_data
                printf "${signerEmail}" >> $request_data
                printf '",
                "name": "' >> $request_data
                printf "${signerName}" >> $request_data
                printf '",
                "recipientId": "1",
                "routingOrder": "1",
                "tabs": {
                    "signHereTabs": [
                        {
                            "documentId": "1", "pageNumber": "1",
                            "recipientId": "1", "tabLabel": "SignHereTab",
                            "xPosition": "195", "yPosition": "147"
                        }
                    ]
                }
            }
        ]
    },
    "status": "sent"
}' >> $request_data

# Step 2. Send the request to DocuSign

curl --header "Authorization: Bearer ${accessToken}" \
     --header "Content-Type: application/json" \
     --data-binary @${request_data} \
     --request POST ${basePath}/v2.1/accounts/${accountId}/envelopes \
     --output ${response} 

echo ""
echo "Response:"
cat $response  | json_pp
echo ""

# cleanup
rm "$request_data"
rm "$response"
rm "$doc1_base64"

echo ""
echo ""
echo "Done."
echo ""
