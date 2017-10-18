# What is XMR-Stak-CPU?

XMR-Stak-CPU is a universal Stratum pool miner. This is the CPU-mining version.

This docker image autoconfigures threads as suggested by xmr-stak-cpu. All xmr-stak-cpu's config.txt variables can be configured with docker run environment variables.

## Links

- [Discussion](https://www.reddit.com/r/Monero/comments/5lsfgt/xmrstakcpu_high_performance_open_source_miner/)
- [Source Code](https://github.com/fireice-uk/xmr-stak-cpu)
- [Dockerfile](https://github.com/timonmat/docker-xmr-stak-cpu)

# How to use this image

```console
docker run -d --restart unless-stopped -e WALLET_ADDRESS='' -e POOL_PASSWORD='' -e POOL_ADDRESS='' -e AUTO_THREAD_CONFIG=true --name xmr-stak-cpu timonmat/xmr-stak-cpu
```

'AUTO_THREAD_CONFIG=true' uses the xmr-stak-cpu recommended thread settings.

You can also use (for example)
```console
-e THREAD_CONFIG='{ "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 0 },{ "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 1 },{ "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 3 },{ "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 4 },'
```

without the AUTO_THREAD_CONFIG=true, or THREAD_CONFIG="" env variables the image starts up a number of threads equivalent to core count, which works best when you have for example 2 physical processors, and the (L3 cache/2) is higher than core count on one processor. 

You can set all config.txt [GitHub](https://github.com/fireice-uk/xmr-stak-cpu/blob/master/config.txt) variables as docker run environment variables. Just use all caps in env var names. 


Large pages need a properly set up OS. Run this on host side.
```console
sudo sysctl -w vm.nr_hugepages=128 && ulimit -l 262144 
```

Fetch logs of a container:

```console
$ docker logs --tail 1000 -f xmr-stak-cpu
```

# Donations

Donations for work on dockerizing are accepted at:


- XMR minecoins: `49TfoHGd6apXxNQTSHrMBq891vH6JiHmZHbz5Vx36nLRbz6WgcJunTtgcxnoG6snKFeGhAJB5LjyAEnvhBgCs5MtEgML3LU`
- XMR timonmat: `4446nVBcqNvbAxRU3XBLiSVq1DuSohG8q6n9n7rhAMBiW88LeoMmHPnbcYxDgdSfCCgG3xW9zfhCQDnQRFNjwt1X3AyifpJ`
- XMR neffets: `44aEKfjyBVDcTBech3pjF5ZJd8w82FxWCXG319nJVRzmRCWLZQfWVwPRJBNFXm7WTHinTu2Wz166k2niYRkmAyTaSPYNtv4`

# Thanks!
This is a fork from Minecoins/docker-xmr-stak-cpu docker image, thanks to Minecoins, and with added env variable support by TimonMat!
