package org.shoukaiseki.answerrecorder.issue.utils


import java.text.DecimalFormat
import java.text.SimpleDateFormat
import java.util.Date
import java.util.logging.SimpleFormatter
import java.util.regex.Pattern

/**
 * org.shoukaiseki.answerrecorder.issue.utils.StringKit <br></br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-12-07 07:53:25<br></br>
 * ブログ http://shoukaiseki.blog.163.com/<br></br>
 * E-メール jiang28555@Gmail.com<br></br>
 */
open class StringKit {

    companion object {
        @JvmField val INSTANCE = StringKit()
        @JvmField val numberFormat = DecimalFormat("####")

    }

    /**
     * 是否为空或者null
     * @param str
     * @return
     */
    fun isBlank(str: String?): Boolean {
        return str == null || str.trim { it <= ' ' }.isEmpty()
    }

    /**
     * 是否为字母
     * @param str
     * @return
     */
    fun isLetter(str: String): Boolean {
        val pattern = Pattern.compile("[a-zA-Z]*")
        return pattern.matcher(str).matches()
    }

    /**
     * 是否为数字
     * @param str
     * @return
     */
    fun isNumeric(str: String): Boolean {
        for (i in 0 until str.length) {
            println(str[i])
            if (!Character.isDigit(str[i])) {
                return false
            }
        }
        return true
    }

    /**
     * 时间差计算
     * @param starttime 毫秒
     * @param endtime 毫秒
     * @return **m**s**ms
     */
    fun timeDifference(starttime: Long, endtime: Long): String {
        var s = ""
        val timeTemp = endtime - starttime
        s = (timeTemp / (1000 * 60)).toString() + "m" + timeTemp / 1000 % 60 + "s" + timeTemp % 1000 + "ms"
        return s
    }

    /**
     * 格式化显示时间
     * @param time 要格式化的时间
     * @param format 默认为:yyyy-MM-dd hh:mm:ss
     * @return
     */
    @JvmOverloads
    open fun formatTime(time: Date, format:String="yyyy-MM-dd hh:mm:ss"): String {
        var str = SimpleDateFormat(format).format(time)
        return str
    }


}
