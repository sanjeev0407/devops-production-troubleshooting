# Runbook 06 — Route 53 DNS / TLS
1. Capture hostname, resolver, client location, error and start time.
2. `dig app.example.com A`; `dig NS example.com`; `nslookup app.example.com`.
3. TLS: `curl -Iv https://app.example.com`; `openssl s_client -connect app.example.com:443 -servername app.example.com`.
4. Check authoritative delegation, record type/value/TTL, ACM status/SAN/expiry and CloudFront/ALB association.
5. CloudFront viewer certificate must be in `us-east-1`.
6. NXDOMAIN: zone/delegation/record. Wrong target: stale alias. TLS mismatch: SAN/SNI/chain/region/expiry.
7. Changes require owner approval. Preserve MX/TXT/SPF/DKIM/DMARC and ACM validation records.
8. Validate authoritative/public resolvers, all hostnames, TLS chain and app response.
