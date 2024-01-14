package Runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class karateRunner {

    public static void main(String[] args) {
        List<String> featureFiles = new ArrayList<>();
        featureFiles.add("classpath:features/Pets/101AddNewPet.feature");
        featureFiles.add("classpath:features/Pets/103FindPetById.feature");
        featureFiles.add("classpath:features/Pets/105UpdatePet.feature");
        featureFiles.add("classpath:features/Pets/104FindPetByStatus.feature");
        featureFiles.add("classpath:features/Pets/106UpdatePetWithFormData.feature");
        featureFiles.add("classpath:features/Pets/107UploadImage.feature");
        featureFiles.add("classpath:features/Pets/102DeletePet.feature");
        

        Results results = Runner.path(featureFiles)
                .outputCucumberJson(true)
                .tags("@Pet")
                .parallel(1);

        //generateCucumberReport(results);
    }

    private static void generateCucumberReport(Results results) {
        List<String> jsonPaths = new ArrayList<>();
        String reportDir = results.getReportDir();
        System.out.println(reportDir);

        File[] jsonFiles = new File(reportDir).listFiles((dir, name) -> name.endsWith(".json"));

        if (jsonFiles != null) {
            for (File jsonFile : jsonFiles) {
                jsonPaths.add(jsonFile.getAbsolutePath());
            }
        }

        Configuration config = new Configuration(new File("cucumber-reports"), "swaggerPetStoreApi");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
