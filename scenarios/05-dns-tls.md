# Scenario 05 — DNS/TLS Failure
Fictional alert: browser reports expired certificate. Check dig, authoritative NS, openssl, ACM status/SAN/expiry, DNS validation CNAME and CloudFront/ALB association.
**Exercise root cause:** validation CNAME removed during DNS cleanup.
**Recovery:** restore exact validation record and follow approved certificate procedure.
**Prevention:** protect validation records, expiry alarms and DNS change review.
