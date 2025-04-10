<script setup>
import { Link } from '@inertiajs/vue3'
import { computed } from 'vue'
import { usePage } from '@inertiajs/vue3'

import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import ColumnGroup from 'primevue/columngroup';
import Row from 'primevue/row';
import Button from 'primevue/button'

import Tabs from 'primevue/tabs';
import TabList from 'primevue/tablist';
import Tab from 'primevue/tab';
import TabPanels from 'primevue/tabpanels';
import TabPanel from 'primevue/tabpanel';


import NewTask from './NewTask.vue';
import RequestLeave from './RequestLeave.vue';

const page = usePage()
const employee = computed(() => page.props.employee)


defineProps({
  leave_balances: Array,
  tasks: Array,
  interviews: Array,
  employees: Array,
  leave_policies: Array,
})
</script>

<template>
  <h2 class="page-heading">QuickView </h2>
  <div class="page-section">
    <div class="subsection">
      <h3 class="heading belgrano-regular">Leave Balances</h3>
      <div>
        <RequestLeave :leave_policies />
      </div>

    </div>

    <DataTable :value="leave_balances" tableStyle="min-width: 50rem">
      <Column field="name" header="Leave Type"></Column>
      <Column field="expires" header="Expires"></Column>
      <Column field="balance" header="Balance"></Column>
      <Column field="category" header="Category"></Column>
    </DataTable>
  </div>

  <div class="page-section">
    <div class="subsection">
      <h2 class="heading belgrano-regular"> TaskBox </h2>
      <div>
        <NewTask :employees />
      </div>
    </div>

    <div>
      <DataTable :value="tasks" tableStyle="min-width: 50rem">
        <Column field="title" header="Title"></Column>
        <Column field="assigned_by" header="Assigned By"></Column>
        <Column field="assigned_on" header="Assigned On"></Column>
        <Column field="status" header="Status"></Column>
        <Column field="due_on" header="Due On"></Column>
      </DataTable>
    </div>
  </div>
  <div class="page-section">
    <h2 class="heading belgrano-regular">Interviews</h2>
    <div>
      <DataTable :value="interviews" tableStyle="min-width: 50rem">
        <Column field="position" header="Job Position"></Column>
        <Column field="interviewee" header="Candidate"></Column>
        <Column field="stage" header="Stage"></Column>
        <Column field="scheduled_on" header="Interview Date"></Column>
        <Column field="scheduled_at" header="Interview Time"></Column>
      </DataTable>
    </div>
  </div>
</template>

<style scoped>
.subsection {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
  padding: 12px;
}
</style>
