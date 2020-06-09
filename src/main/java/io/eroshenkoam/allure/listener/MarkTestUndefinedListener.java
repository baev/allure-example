package io.eroshenkoam.allure.listener;

import io.qameta.allure.listener.TestLifecycleListener;
import io.qameta.allure.model.TestResult;

public class MarkTestUndefinedListener implements TestLifecycleListener {

    public void beforeTestWrite(final TestResult result) {
        final boolean pending = result.getLabels().stream()
                .anyMatch(label -> label.getName().equals("tag") && label.getValue().equals("pending"));
        if (pending) {
            result.setStatus(null);
        }
    }

}
