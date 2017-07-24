/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.diit.sn.util;

/**
 *
 * @author paul
 */

import java.math.BigInteger;
import java.security.SecureRandom;
 
public class RSA {
   private final static BigInteger one      = new BigInteger("1");
   private final static SecureRandom random = new SecureRandom();
   private BigInteger privateKey;
   private BigInteger publicKey;
   private BigInteger modulus;
   
   public RSA(){}
   public BigInteger getPrivateKey()
   {
	   return this.privateKey;
   }
   
   public BigInteger getPublicKey()
   {
	   return this.publicKey;
   }

   // generate an N-bit (roughly) public and private key
 public RSA(int N) {
      BigInteger p = BigInteger.probablePrime(N/2, random);
      BigInteger q = BigInteger.probablePrime(N/2, random);
      BigInteger phi = (p.subtract(one)).multiply(q.subtract(one));
      modulus    = p.multiply(q);                                  
      publicKey  = new BigInteger("65537");     // common value in practice = 2^16 + 1
      privateKey = publicKey.modInverse(phi);
   }


  public BigInteger encrypt(BigInteger message) {
      return message.modPow(publicKey, modulus);
   }

 public BigInteger decrypt(BigInteger encrypted) {
      return encrypted.modPow(privateKey, modulus);
   }

   public String toString() {
      String s = "";
      s += "public  = " + publicKey  + "\n";
      s += "private = " + privateKey + "\n";
      s += "modulus = " + modulus;
      return s;
   }
 
   public BigInteger envryptTocken(String tocken) {
	      int N = 12;
	      RSA key = new RSA(N);
	    
 
      // create random message, encrypt and decrypt
      //BigInteger message = new BigInteger(N-1, random);
	      BigInteger message = new BigInteger(tocken);

      //// create message by converting string to integer
      // String s = "test";
      // byte[] bytes = s.getBytes();
      // BigInteger message = new BigInteger(s);

      BigInteger encrypt = key.encrypt(message);
     /* BigInteger decrypt = key.decrypt(encrypt);
      logger.info("message   = " + message);
      logger.info("encrpyted = " + encrypt);
      logger.info("decrypted = " + decrypt);*/
      
      return encrypt;
   }
}


