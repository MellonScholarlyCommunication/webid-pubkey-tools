# WEBID-PUBKEY-TOOLS

Javascript Node.JS tools to create RSA public and private keys, a WebId and authentication against a webid-pubkey server.

## INSTALL

Need https://nodejs.org/en

## USAGE

### Create a public/private key

```
node bin/generate_keys.js <outdir>
```

### Create a WebId document

```
node bin/make_webid.js <webid> <public-key>
```

- `<webid>` is the web location where this document will be stored as a JSON-LD file
   - _E.g. http://your.domain/profile/id.jsonld_
- `<public-key>` is the path to your public key file

### Make authenticated requests against a webid-public key server

```
node bin/headers.js <priv-key> <webid> POST https://labs.eventnotifications.net/inbox/ example.jsonld
```

### Issue a POST request

Use the headers from the previous command in a curl command:

```
curl -X POST <headers> -H 'Content-type: application/ld+json' --data-binary example.jsonld https://labs.eventnotifications.net/inbox/
```