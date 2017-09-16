package com.ghost.memcached;

import com.danga.MemCached.MemCachedClient;
import com.danga.MemCached.SockIOPool;

public class CacheHelper {
	private static MemCachedClient mcc = new MemCachedClient();

	private CacheHelper() {
	}
	static {
		String[] server = { "192.168.1.99:2222" };
		Integer[] weights = { 1 };
		SockIOPool pool = SockIOPool.getInstance();
		pool.setServers(server);
		pool.setWeights(weights);
		pool.setInitConn(5);
		pool.setMinConn(5);
		pool.setMaxConn(250);
		pool.setMaxIdle(1000);
		pool.setMaintSleep(30);

		pool.setNagle(false);
		pool.setSocketConnectTO(0);
		pool.setSocketTO(3000);
		pool.setHashingAlg(3);
		
		pool.initialize();
	}

	public static MemCachedClient getMemCachedClient() {
		return mcc;
	}
}
