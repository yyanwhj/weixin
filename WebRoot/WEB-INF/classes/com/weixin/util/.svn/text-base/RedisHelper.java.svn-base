package com.weixin.util;

import java.io.File;
import java.io.FileReader;
import java.io.Reader;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.JedisSentinelPool;
import redis.clients.jedis.Protocol;
import redis.clients.jedis.ScanParams;
import redis.clients.jedis.ScanResult;
import redis.clients.jedis.SortingParams;
import redis.clients.jedis.Tuple;
import redis.clients.jedis.exceptions.JedisConnectionException;

public class RedisHelper {

	
	public static String  BUTTON_AUTH_URL="BUTTON_AUTH_URL:";
	
	static private Logger logger = Logger.getLogger(RedisHelper.class);

	private static RedisHelper redisHelper = new RedisHelper();

	public static RedisHelper getInstance() {
		return redisHelper;
	}
	
	private static JedisSentinelPool redisPool;
	static {
		try {
			String filePath=RedisHelper.class.getResource("/redis.conf").getFile();
			File redisConfFile = new File(filePath);

			Reader reader =null;
			if( redisConfFile.exists()){
				String confPath = redisConfFile.getAbsolutePath();
				reader = new FileReader(confPath);
			}
			
			Properties prop = new Properties();
			prop.load(reader);

			String addresses = prop.getProperty("sentinels");
			Set<String> sentinelAddres = new HashSet<String>();
			for (String addr: addresses.split(",")) {
				try {
					sentinelAddres.add(addr.trim());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			JedisPoolConfig poolConfig = new JedisPoolConfig();
			poolConfig.setMinIdle(10);
			poolConfig.setMaxIdle(20);
			poolConfig.setMaxTotal(100);
			poolConfig.setMaxWaitMillis(5000);
			poolConfig.setTestOnBorrow(true);
			
			String masterName = prop.getProperty("master_name").trim();
			String db_name = prop.getProperty("database");
			if(StringUtils.isBlank(db_name)){
				db_name="1";
			}
			int db=Integer.parseInt(db_name);
			redisPool = new JedisSentinelPool(masterName, sentinelAddres, poolConfig,Protocol.DEFAULT_TIMEOUT,null,db);
		} catch (Exception e) {
			e.printStackTrace();
			logger.warn(e.getMessage(), e);
		}
	}

	public void setIfNull(String key, Object val) {
		Jedis jedis = null;
		boolean success = true;
		try {
			jedis = redisPool.getResource();
			jedis.setnx(key, String.valueOf(val));
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}

	}

	public static long incValue(String key) {
		Jedis jedis = null;
		boolean success = true;
		try {
			jedis = redisPool.getResource();
			long val = jedis.incr(key);
			return val;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}

	}

	public static long srem(String key, String[] members) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			jedis.del(key);
			Long val = jedis.srem(key, members);

			return val;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static long lpushList(String key, String[] dataList) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			Long val = jedis.lpush(key, dataList);

			return val;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static long rpushList(String key, String[] dataList) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			Long val = jedis.rpush(key, dataList);

			return  val;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static long lpush(String key, String value) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			Long val = jedis.lpush(key, value);

			return val;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	
	public static List<String> brpop(String key, int timeout) {//��λ��
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.brpop(timeout, key);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static String getValue(String key) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			String val = jedis.get(key);

			return val;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static int setRange(String key, long offset, String value) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			Long val = jedis.setrange(key, offset, value);

			return (int) (long) val;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static List<String> subList(String key, int ind, int num) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			List<String> valList = jedis.lrange(key, ind, ind + num);
			return valList;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static String setValue(String key, String value) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			String val = jedis.set(key, value);

			return val;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static long del(String key) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			Long val = jedis.del(key);

			return (int) (long) val;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static String lset(String key, long index, String value) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			String lset = jedis.lset(key, index, value);

			return lset;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static List<String> lrange(String key, long start, long end) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.lrange(key, start, end);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static long append(String key, String value) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.append(key, value);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static String hget(String key, String field) {

		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			String hmget = jedis.hget(key, field);
			return hmget;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static Long setrange(String key, long offset, String value) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			Long setrange = jedis.setrange(key, offset, value);
			return setrange;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}


	public static long hdel(String key) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			Long hdel = jedis.hdel(key);
			return hdel;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static long hset(String key, String field, String value) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			long hmget = jedis.hset(key, field, value);
			return hmget;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	
	public static long hsetnx(String key, String field, String value) {
		Jedis jedis = null;
		boolean success = true;
		try {
			jedis = redisPool.getResource();
			long hmget = jedis.hsetnx(key, field, value);
			return hmget;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	
	public static String hmset(final String key, final Map<String, String> hash) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();
			
			String hmset = jedis.hmset(key, hash);
			return hmset;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static List<String> hmget(final String key, final String[] fields) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();
			
			List<String> list = jedis.hmget(key, fields);
			return list;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static long sunionstore(String dstkey, String key) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			long hmget = jedis.sunionstore(dstkey, key);
			return hmget;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static Long del(String[] keys) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			Long del = jedis.del(keys);
			return del;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static Long expireAt(String key, long seconds) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			Long val = jedis.expireAt(key, seconds);
			return val;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static Long expire(String key, int seconds) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			Long val = jedis.expire(key, seconds);
			return val;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static long lpushxList(String key, String string) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			Long val = jedis.lpushx(key, string);

			return val;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static String rpop(String key) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			String val = jedis.rpop(key);
			return val;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static long removeListValues(String key, String value) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			Long val = jedis.lrem(key, 1, value);
			return val;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static long hIncVal(String key, String field, int byVal) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			Long val = jedis.hincrBy(key, field, byVal);
			return val;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static boolean hexists(String key, String field) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();
			return jedis.hexists(key, field);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {   
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	
	
	public static boolean existsKey(String key) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.exists(key);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	
	

	public static List<String> hvals(String key) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.hvals(key);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static Map<String, String> hgetAll(String keys) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			Map<String, String> hgetAll = jedis.hgetAll(keys);
			return hgetAll;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}

	public static long smove(String srckey,String dstkey,String member) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			Long smove = jedis.smove(srckey, dstkey, member);
			return smove;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	
	public static long zadd(String key, Map<String, Double> scoreMembers) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.zadd(key, scoreMembers);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	
	public static long zadd(String key, Double score ,String member) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.zadd(key, score, member);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	
	public static Set<String> zrange(String key, long start ,long end) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.zrange(key, start, end);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	
	public static Set<String> zrevrange(String key, long start ,long end) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();
			
			return jedis.zrevrange(key, start, end);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	
	public static Set<Tuple> zrevrangeWithScores(String key, long start ,long end) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();
			
			return jedis.zrevrangeWithScores(key, start, end);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	
	public static Set<Tuple> zrangeWithScores(String key, long start ,long end) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();
			
			return jedis.zrangeWithScores(key, start, end);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	
	public static long zrevrank(String key, long start, long end) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.zremrangeByRank(key, start, end);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	
	public static Set<String> zrangeByScore(String key, double min, double max,int index,int count) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.zrangeByScore(key, min, max, index,count);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	
	public static Set<String> zrevrangeByScore(String key,double max, double min, int index,int count) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.zrevrangeByScore(key, max, min, index, count);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	

	
	public static Set<Tuple> zrangeByScoreWithScores(String key,double max, double min, int index,int count) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.zrangeByScoreWithScores(key, min, max, index, count);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	public static long zcount(String key, double min, double max) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.zcount(key, min, max);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	public static long zcard(String key) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.zcard(key);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	public static long zrem(String key, String[] members) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.zrem(key, members);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	public static long zrem(String key, String  members) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.zrem(key, members);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	public static List<String> sort(String key, SortingParams sortingParameters) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.sort(key, sortingParameters);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	public  static  ScanResult<Tuple> zscan(String key, String cursor,ScanParams params) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.zscan(key, cursor,params);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	
	public  static  ScanResult<Entry<String, String>> hscan(String key, String cursor,ScanParams params) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();
			
			return jedis.hscan(key, cursor, params);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	
	public static  double zincrby(String key,double score, String member) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.zincrby(key, score, member);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	public  static Set<Tuple> zrevrangeByScoreWithScores(String key,double max,double min, int offset,int count) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.zrevrangeByScoreWithScores(key, max, min, offset, count);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	public  static Double zscore(String key,String member) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			return jedis.zscore(key, member);
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}

			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	
	public static long lrem(String key,int count, String value) {
		Jedis jedis = null;
		
		boolean success = true;
		try {
			
			jedis = redisPool.getResource();

			long val = jedis.lrem(key, count, value);

			return val;
		} catch (JedisConnectionException e) {
			success = false;
			if (jedis != null) {
				redisPool.returnBrokenResource(jedis);
			}
			logger.error(e.toString(), e);
			throw new RuntimeException(e);
		} finally {
			if(success && jedis != null){
			    redisPool.returnResource(jedis);
			}
		}
	}
	
		
	public static void main(String[] args) {
		
	}
}
