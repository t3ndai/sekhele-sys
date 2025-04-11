<template>
    <div>

        <h2 class="page-heading">Job Posting </h2>

        <Link :href="`/employees/${employee.id}/recruitment`">Back to Recruitment</Link>

        <div>
            <div><span>Job Active On: </span>{{ job_posting.date_open }}</div>

            <div><span>Job Closes On: </span> {{ job_posting.date_close }}</div>

            <div><span>Number of Positions:</span> {{ job_posting.num_positions }}</div>

        </div>

        <JobDescription :description="job_posting.description" />
    </div>



</template>

<script setup>

import { Link, usePage } from '@inertiajs/vue3'
import { computed } from 'vue'

import JobDescription from '../../components/JobDescription.vue';
const page = usePage()
const employee = computed(() => page.props.employee)

defineProps({
    job_posting: Object
})

</script>