<template>

  <Head title="New new joiner" />

  <h1 class="font-belgrano">Onboard {{ name }}</h1>

  <Form :new_joiner="new_joiner" :managers submitText="Start Onboarding" @onSubmit="handleSubmit" />

  <br />

  <div>
    <Link href="/new_joiners">Back to new joiners</Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { new_joiner, managers, name, job_applicant_id } = defineProps(['new_joiner', 'managers', 'name', 'job_applicant_id'])

const handleSubmit = (form) => {
  form.transform((data) => ({ new_joiner: data }))
  form.post(`/job_applicants/${job_applicant_id}/onboard_save`)
}
</script>
