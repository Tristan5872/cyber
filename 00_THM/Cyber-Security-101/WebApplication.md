# Security Headers

## Content Security Policy (CSP)
This header help prevent common attacks such as Cross-site Scripting (XSS). It tells the browser which sources are safe to load content from.
An example of a CSP header is:
`Content-Security-Policy: default-src 'self'; script-src 'self' https://site.com; style-src 'self'`
- **default-src**: Speciies the default policy, *which here is set to 'self', meaning only content from the same origin is allowed.*
- **script-src**: Specifies allowed sources for JavaScript. *which here allow scripts from the same origin and from `https://site.com`.*
- **style-src**: Specifies allowed sources for CSS. *which here allow styles from the same origin.*

## Strict-Transport-Security (HSTS)
The HSTS header ensures that web browsers will always connect over HTTPS. An example of an HSTS header is:
`Strict-Transport-Security: max-age=63072000; includeSubDomains; preload`
- **max-age**: Specifies the time in seconds that the browser should remember to only connect via HTTPS. *Here it is set to 2 years (63072000 seconds).*
- **includeSubDomains**: Indicates that the rule applies to all subdomains as well.
- **preload**: Indicates that the domain should be included in browsers' HSTS preload list (users don’t have to visit once before HTTPS-only enforcement kicks in).

## X-Content-Type-Options
The X-Content-Type-Options header is used to prevent MIME type sniffing. An example of an X-Content-Type-Options header is:
`X-Content-Type-Options: nosniff`
- **nosniff**: This value tells the browser to not attempt to guess the MIME type of a resource and instead use the type specified in the Content-Type header.

## Referrer-Policy
The Referrer-Policy header controls how much referrer information is sent with requests. An example of a Referrer-Policy header is:
`Referrer-Policy: no-referrer`
- **no-referrer**: This value indicates that the browser should not send any referrer information with requests.
- **same-origin**: This value indicates that the browser should only send referrer information when the destination is part of the same origin.
- **strict-origin**: This value indicates that the browser should only send referrer information when the protocol stays the same (e.g., HTTPS to HTTPS).
- **strict-origin-when-cross-origin**: This is similar to strict-origin except for same-origin requests, where it sends the full URL path in the origin header.

# JavaScript

## Minification
Minification is the process of removing unnecessary characters from code without changing its functionality.
==> It helps reduce the size of the code, which can improve load times and performance.

## Obfuscation
Obfuscation is the process of making code difficult to read and understand.
Online tool : https://codebeautify.org/javascript-obfuscator

## Deobfuscation
Deobfuscation is the process of reversing obfuscation to make code readable again.
Online tool : https://obf-io.deobfuscate.io/