package std.gunfz.key_hash

import android.content.Context
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.util.Base64
import android.util.Log
import java.security.MessageDigest
import java.security.NoSuchAlgorithmException

class KeyHash {
    companion object {
        const val GET_KEY_HASH = "getKeyHash"
        fun printKeyHash(context: Context, packageName: String): String {
            var keyhash = "";
            val info: PackageInfo
            try {
                info =  context.packageManager.getPackageInfo(packageName, PackageManager.GET_SIGNATURES)
                for (signature in info.signatures) {
                    var md: MessageDigest = MessageDigest.getInstance("SHA")
                    md.update(signature.toByteArray())
                    val something = String(Base64.encode(md.digest(), 0))
                    //String something = new String(Base64.encodeBytes(md.digest()));
                    Log.i("hash key", something)
                    keyhash = something
                }

            } catch (e1: PackageManager.NameNotFoundException) {
                Log.i("name not found", e1.toString())
            } catch (e: NoSuchAlgorithmException) {
                Log.i("no such an algorithm", e.toString())
            } catch (e: Exception) {
                Log.i("exception", e.toString())
            }
            return keyhash;
        }
    }
}