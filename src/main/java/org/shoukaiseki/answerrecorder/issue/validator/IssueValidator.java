package org.shoukaiseki.answerrecorder.issue.validator;

import org.shoukaiseki.answerrecorder.issue.model.Issue;
import org.springframework.lang.Nullable;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * org.shoukaiseki.answerrecorder.issue.validator.IssueValidator <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-11-28 17:06:29<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
public class IssueValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return Issue.class.equals(clazz);
    }

    @Override
    public void validate(@Nullable Object target, Errors errors) {
        ValidationUtils.rejectIfEmpty(errors, "coursetitle", null, "课程名称不能为空");
        ValidationUtils.rejectIfEmpty(errors, "trainingname", null, "培训名称不能为空");
    }
}
