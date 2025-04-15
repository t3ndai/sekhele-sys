<template>
    <h2 class="page-heading">HR Admin</h2>
    <Tabs value="0">
        <Tablist>
            <Tab value="0">Employees</Tab>
            <Tab value="1">Benefits</Tab>
            <Tab value="2">Assets</Tab>
            <Tab value="3">Job Functions & Levels</Tab>
            <Tab value="4">Leave</Tab>
            <Tab value="5">Documents</Tab>
            <Tab value="6">Recruiting</Tab>
            <Tab value="7">Performance</Tab>
            <Tab value="8">Engagement</Tab>
        </Tablist>

        <TabPanels>
            <TabPanel value="0">
                <Employees />
            </TabPanel>
            <TabPanel value="1">
                <Benefits />
            </TabPanel>
            <TabPanel value="2">
                <Assets />
            </TabPanel>
            <TabPanel value="3">
                <JobFunctions />
            </TabPanel>
            <TabPanel value="4">
                <Leave />
            </TabPanel>
            <TabPanel value="5">
                <Documents />
            </TabPanel>
            <TabPanel value="6">
                <Recruiting />
            </TabPanel>
            <TabPanel value="7">
                <Performance />
            </TabPanel>
            <TabPanel value="8">
                <Engagement />
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
</script>

<style scoped></style>
