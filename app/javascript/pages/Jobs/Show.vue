<template>
    <div class="font-belgrano text-4xl text-center mb-2">
        {{ job_posting.title }}
    </div>

    <div class="text-gray-800">Closes On: {{ job_posting.date_close }}</div>

    <div class="mb-7">
        <JobDescripton :description="job_posting.description" />
    </div>

    <div class="flex">
        <!--<Link
            :href="`/organizations/${org_id}/jobs/${job_posting.id}/apply`"
            class="apply-btn"
        >
            Apply
            </Link>-->
        <div>
            <CandidateApply :job_posting />
        </div>
    </div>
</template>

<script setup>
import { Link } from "@inertiajs/vue3";
import { computed } from "vue";
import { usePage } from "@inertiajs/vue3";
import JobDescripton from "@/components/JobDescription.vue";
import CandidateApply from "./CandidateApply.vue";

const page = usePage();
const org_id = computed(() => page.props.org_id).value;

defineProps({
    job_posting: Object,
});
</script>

<style scoped>
.apply-btn {
    border-radius: 13px;
    padding: 12px;
    color: white;
    background-color: var(--color-indigo-600);
    text-decoration: none;
}
</style>
