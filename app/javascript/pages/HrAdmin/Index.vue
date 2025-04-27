<template>
    <h2 class="page-heading">HR Admin</h2>
    <Tabs value="0" scrollable>
        <TabList>
            <Tab value="0">Employees</Tab>
            <Tab value="1">Benefits</Tab>
            <Tab value="2">Assets</Tab>
            <Tab value="3">Departments & Locations</Tab>
            <Tab value="4">Job Functions & Levels</Tab>
            <Tab value="5">Leave</Tab>
            <Tab value="6">Documents</Tab>
            <Tab value="7">Recruiting</Tab>
            <Tab value="8">Performance</Tab>
            <Tab value="9">Engagement</Tab>
        </TabList>

        <TabPanels>
            <TabPanel value="0">
                <Employees :employees />
            </TabPanel>
            <TabPanel value="1">
                <Benefits :benefits :benefit_types />
            </TabPanel>
            <TabPanel value="2">
                <Assets :asset_categories :assets />
            </TabPanel>
            <TabPanel value="3">
                <Departments :departments :locations />
            </TabPanel>
            <TabPanel value="4">
                <JobFunctions :job_levels :job_functions :departments />
            </TabPanel>
            <TabPanel value="5">
                <Leave :leave_categories :leave_policies />
            </TabPanel>
            <TabPanel value="6">
                <Documents :documents :company_files :company_docs />
            </TabPanel>
            <TabPanel value="7">
                <Recruiting :interview_stages :stage_types />
            </TabPanel>
            <TabPanel value="8">
                <Performance :performance_reviews :performance_review_types />
            </TabPanel>
            <TabPanel value="9">
                <Engagement :pulse_surveys />
            </TabPanel>
        </TabPanels>
    </Tabs>
</template>

<script setup>
import Tabs from "primevue/tabs";
import TabList from "primevue/tablist";
import Tab from "primevue/tab";
import TabPanels from "primevue/tabpanels";
import TabPanel from "primevue/tabpanel";

import Employees from "./Employees.vue";
import Benefits from "./Benefits.vue";
import Assets from "./Assets.vue";
import JobFunctions from "./JobFunctions.vue";
import Leave from "./Leave.vue";
import Documents from "./Documents.vue";
import Recruiting from "./Recruiting.vue";
import Performance from "./Performance.vue";
import Engagement from "./Engagement.vue";
import Departments from "./Departments.vue";

defineProps({
    employees: Array,
    benefits: Array,
    benefit_types: Array,
    asset_categories: Array,
    assets: Array,
    departments: Array,
    locations: Array,
    job_functions: Array,
    job_levels: Array,
    leave_categories: Array,
    leave_policies: Array,
    documents: Array,
    company_files: Array,
    company_docs: Array,
    interview_stages: Array,
    stage_types: Array,
    performance_reviews: Array,
    performance_review_types: Array,
    pulse_surveys: Array,
});
</script>

<style scoped></style>
