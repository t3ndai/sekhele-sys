<template>
    <h2 class="heading belgrano-regular page-heading">Recruitment</h2>

    <div class="page-section">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Listed Jobs</h3>
            <div>
                <!---<RequestLeave :leave_policies />-->
            </div>
        </div>

        <div>
            <DataTable :value="listed_jobs" tableStyle="min-width: 50rem">
                <Column field="title" header="Title" />
                <Column field="num_positions" header="Open Positions" />
                <Column field="date_open" header="Date Open" />
                <Column field="date_close" header="Date Close" />
                <Column field="created" header="Created on" />
            </DataTable>
        </div>
    </div>

    <div class="page-section">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Job Applicants</h3>
        </div>
        <div>
            <DataTable :value="job_applicants" tableStyle="min-width: 50rem">
                <Column field="name" header="Name" />
                <Column field="position" header="Position" />
                <Column field="applied_on" header="Applied On" />
            </DataTable>
        </div>
    </div>


    <div class="page-section">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Interviews</h3>
        </div>
        <div>
            <DataTable :value="interviews" tableStyle="min-width: 50rem">
                <Column field="stage" header="Stage" />
                <Column field="candidate" header="Candidate" />
                <Column field="interview_on" header="Interview On" />
                <Column field="interview_at" header="Interview At" />
            </DataTable>
        </div>
    </div>
</template>

<script setup>

import { Link } from '@inertiajs/vue3'
import { computed } from 'vue'
import { usePage } from '@inertiajs/vue3'

import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import ColumnGroup from 'primevue/columngroup';
import Row from 'primevue/row';
import Button from 'primevue/button'

const page = usePage()
const employee = computed(() => page.props.employee)

defineProps({
    listed_jobs: Array,
    job_applicants: Array,
    interviews: Array,
})


</script>

<style scoped></style>