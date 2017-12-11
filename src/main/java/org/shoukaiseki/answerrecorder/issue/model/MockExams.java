package org.shoukaiseki.answerrecorder.issue.model;

public class MockExams {

    private String answer="";

    private Issue issue;

    /**
     * EOVWait:未答题css渲染
     * EOVError:回答错误css渲染
     * EOVCorrect:回答正确css渲染
     */
    private String status="EOVWait";

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Issue getIssue() {
        return issue;
    }

    public void setIssue(Issue issue) {
        this.issue = issue;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
