<template>

    <Head title="New Job Posting" />

    <h2 class="page-heading">New Job Posting</h2>

    <div>
        <Form :job_posting="job_posting" submitText="Create Job Posting" @onSubmit="handleSubmit" />
    </div>

    <br />

    <Link :href="`/employees/${employee.id}/recruitment`">Back To Recruitment </Link>
</template>

<script setup>

import { Head, Link, usePage } from '@inertiajs/vue3'
import { computed } from 'vue'
import Form from './Form.vue';

const page = usePage()
const employee = computed(() => page.props.employee)
const org_id = computed(() => page.props.org_id)

defineProps({
    job_posting: Object,
})

function handleSubmit(form) {
    form.transform((data) => ({ job_posting: data }))
    form.post(`/organizations/${org_id.value}/job_postings`)
}




</script>