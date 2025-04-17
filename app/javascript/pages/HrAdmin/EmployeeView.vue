<template>
    <h2 class="page-heading">Employee View</h2>
    <div>
        <div>{{ employee.full_name }}</div>
        <div>{{ employee.job_title }}</div>
    </div>
    <div>
        <Tabs value="0">
            <TabList>
                <Tab value="0">Personal</Tab>
                <Tab value="1">Benefits</Tab>
                <Tab value="2">Assets</Tab>
                <Tab value="3">Job</Tab>
                <Tab value="4">Leave</Tab>
                <Tab value="5">Documents</Tab>
                <Tab value="6">Performance</Tab>
            </TabList>

            <TabPanels>
                <TabPanel value="0">
                    <EmployeePersonalView :employee />
                </TabPanel>
                <TabPanel value="1">
                    <EmployeeBenefitsView :benefits />
                </TabPanel>
                <TabPanel value="2">
                    <EmployeeAssetsView :assets />
                </TabPanel>
                <TabPanel value="3">
                    <EmployeeJobView :jobs />
                </TabPanel>
                <TabPanel value="4">
                    <EmployeeLeaveView
                        :past_leaves
                        :future_leaves
                        :leave_balances
                    />
                </TabPanel>
                <TabPanel value="5">
                    <EmployeeDocuments />
                </TabPanel>
                <TabPanel value="6">
                    <EmployeePerformanceView />
                </TabPanel>
            </TabPanels>
        </Tabs>
    </div>
</template>

<script setup>
import Tabs from "primevue/tabs";
import TabList from "primevue/tablist";
import Tab from "primevue/tab";
import TabPanels from "primevue/tabpanels";
import TabPanel from "primevue/tabpanel";

import EmployeeAssetsView from "./EmployeeAssetsView.vue";
import EmployeeBenefitsView from "./EmployeeBenefitsView.vue";
import EmployeeJobView from "./EmployeeJobView.vue";
import EmployeeLeaveView from "./EmployeeLeaveView.vue";
import EmployeeDocuments from "./EmployeeDocuments.vue";
import EmployeePerformanceView from "./EmployeePerformanceView.vue";
import EmployeePersonalView from "./EmployeePersonalView.vue";

defineProps({
    employee: Object,
    benefits: Array,
    assets: Array,
    jobs: Array,
    past_leaves: Array,
    future_leaves: Array,
    leave_balances: Array,
});
</script>

<style scoped></style>
