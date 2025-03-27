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

const page = usePage()
const employee = computed(() => page.props.employee)


defineProps({
  leave_balances: Array,
  tasks: Array,
  interviews: Array,
  employees: Array
})
</script>

<template>
  <h1>Employee ID: {{ employee.id }}</h1>
  <h2>Employee QuickView </h2>
  <p>My leave balances are:</p>
  <ul>
    <li v-for="leaveBalance in leave_balances" :key="leaveBalance.name">
      {{ leaveBalance.name }}: {{ leaveBalance.balance }}
      <div>
        Expires: {{ leaveBalance.expires }}
      </div>
      <div>
        {{ leaveBalance.category }}
      </div>
    </li>
  </ul>
  <div>
    <h2> TaskBox </h2>
    <div>
      <NewTask :employees />
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
  <div class="mt-4">
    <h2>Interviews</h2>
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
