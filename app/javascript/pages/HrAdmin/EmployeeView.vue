<template>
    <h2 class="page-heading">Employee View</h2>
    <div class="flex flex-col gap-2 mb-4">
        <div class="name">{{ employee.full_name }}</div>
        <div class="title">{{ employee.job_title }}</div>
    </div>
    <div>
        <Tabs value="0">
            <TabList>
                <Tab value="0">Personal</Tab>
                <Tab value="1">Pay</Tab>
                <Tab value="2">Benefits</Tab>
                <Tab value="3">Assets</Tab>
                <Tab value="4">Job</Tab>
                <Tab value="5">Leave</Tab>
                <Tab value="6">Documents</Tab>
                <Tab value="7">Performance</Tab>
            </TabList>

            <TabPanels>
                <TabPanel value="0">
                    <EmployeePersonalView :employee />
                </TabPanel>
                <TabPanel value="1">
                    <EmployeePayView :pay />
                </TabPanel>
                <TabPanel value="2">
                    <EmployeeBenefitsView :benefits />
                </TabPanel>
                <TabPanel value="3">
                    <EmployeeAssetsView :assets />
                </TabPanel>
                <TabPanel value="4">
                    <EmployeeJobView :jobs />
                </TabPanel>
                <TabPanel value="5">
                    <EmployeeLeaveView
                        :past_leaves
                        :future_leaves
                        :leave_balances
                    />
                </TabPanel>
                <TabPanel value="6">
                    <EmployeeDocuments :documents />
                </TabPanel>
                <TabPanel value="7">
                    <EmployeePerformanceView :performance_reviews />
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
    documents: Array,
    performance_reviews: Array,
});
</script>

<style scoped>
.name {
    font-size: 1.5rem;
    font-family: "Belgrano", serif;
    color: #111509;
    font-weight: 400;
}

.title {
    font-size: 1.2rem;
    font-family: "Belgrano", serif;
    color: #111509;
    font-weight: 200;
}
</style>
