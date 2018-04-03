"pool_list" :
[
	{"pool_address" : "{{ POOL_ADDRESS | default("pool.supportxmr.com:5555") }}", "wallet_address" : "{{ WALLET_ADDRESS | default("") }}", "rig_id" : "{{ RIG_ID | default("") }}", "pool_password" : "{{ POOL_PASSWORD | default("") }}", "use_nicehash" : {{ USE_NICEHASH | default("false") }}, "use_tls" : {{ USE_TLS | default("false") }}, "tls_fingerprint" : "{{ TLS_FINGERPRINT | default("") }}", "pool_weight" : 1 },
],

"currency" : "{{ CURRENCY | default("monero7") }}",
