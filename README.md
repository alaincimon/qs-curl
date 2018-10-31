# DocuSign Quickstart API code examples with Curl

Repository: [qs-curl](https://github.com/docusign/qs-curl)

These quick start examples provide straight-forward
curl-based code examples for quickly
trying the DocuSign eSignature API

The repo includes:

1. **qs-01-curl-embed-signing-ceremony.sh** --
   Embedding a signing ceremony in your web application.
2. **qs-02-curl-send-envelope.sh** --
   Sending a signing request via an email to the signer.
3. **qs-03-curl-list-envelopes.sh** -- 
   Listing the envelopes in the user's account, including their status.

These examples do not include authentication. Instead,
use the DocuSign DevCenter's
[OAuth token generator](https://developers.docusign.com/oauth-token-generator)
to create an access token.

For more information, see the
[DocuSign DevCenter Code Examples section](https://developers.docusign.com/esign-rest-api/code-examples).

## Installation

These examples use curl and the bash shell as provided in 
modern versions of MacOS.

Download or clone this repository to your machine
then configure the examples.

### Configure the examples' settings
Each quick start example is a standalone file. You will configure
each of the example files by setting the variables at the top of each
file:

 * **Access token:** Use the [OAuth Token Generator](https://developers.docusign.com/oauth-token-generator).
   To use the token generator, you'll need a
   [free DocuSign Developer's account.](https://go.docusign.com/o/sandbox/)

   Each access token lasts 8 hours, you will need to repeat this process
   when the token expires. You can use the same access token for
   multiple examples.

 * **Account Id:** After logging into the [DocuSign Sandbox system](https://demo.docusign.net),
   you can copy your Account Id from the dropdown menu by your name. See the figure:

   ![Figure](https://raw.githubusercontent.com/docusign/qs-python/master/documentation/account_id.png)
 * **Signer name and email:** Remember to try the DocuSign signing ceremony using both a mobile phone and a regular
   email client.

## Run the examples

Use the bash shell to run the examples:

```
bash qs-01-curl-embed-signing-ceremony.sh
bash qs-02-curl-send-envelope.sh
bash qs-03-curl-list-envelopes.sh
```

## Support, Contributions, License

Submit support questions to [StackOverflow](https://stackoverflow.com). Use tag `docusignapi`.

Contributions via Pull Requests are appreciated.
All contributions must use the MIT License.

This repository uses the MIT license, see the
[LICENSE](https://github.com/docusign/eg-01-Python-jwt/blob/master/LICENSE) file.
