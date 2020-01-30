# List envelopes and their status
# List changes for the last 10 days

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

# The API base_path
basePath='https://demo.docusign.net/restapi'

echo ""
echo "Sending the list envelope status request to DocuSign..."
echo "Results:"
echo ""

# Calculate the from_date query parameter and use the ISO 8601 format.
# Example:
# from_date=2018-09-30T07:43:12+03:00
# For a Mac, 10 days in the past:
if date -v -10d &> /dev/null ; then
    # Mac
    from_date=`date -v -10d '+%Y-%m-%dT%H:%M:%S%z'`
else
    # Not a Mac
    from_date=`date --date='-10 days' '+%Y-%m-%dT%H:%M:%S%z'`
fi

curl --header "Authorization: Bearer ${accessToken}" \
     --header "Content-Type: application/json" \
     --get \
     --data-urlencode "from_date=${from_date}" \
     --request GET ${basePath}/v2.1/accounts/${accountId}/envelopes | json_pp 

echo ""
echo ""
echo "Done."
echo ""
