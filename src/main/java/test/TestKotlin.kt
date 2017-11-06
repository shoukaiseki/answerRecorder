package test

/**
 * test.TestKotlin <br></br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-10-16 17:14:04<br></br>
 * ブログ http://shoukaiseki.blog.163.com/<br></br>
 * E-メール jiang28555@Gmail.com<br></br>
 */
open class TestKotlin(){

    companion object {
        fun showString():String{
            return "${KotlinVersion.CURRENT}"
        }
    }
}
