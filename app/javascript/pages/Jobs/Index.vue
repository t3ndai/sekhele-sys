<template>
    <div class="font-belgrano text-4xl text-center">Open Jobs</div>

    <div>
        <div
            v-for="job_posting in job_postings"
            class="flex job-card justify-between"
        >
            <div class="text-2xl font-jura text-slate-600">
                {{ job_posting.title }}
            </div>
            <div>
                <Link
                    :href="`/organizations/${org_id}/jobs/${job_posting.id}`"
                    class="view-btn"
                >
                    View Job Details
                </Link>
            </div>
        </div>
    </div>
</template>

<script setup>
import { Link } from "@inertiajs/vue3";
import { computed } from "vue";
import { usePage } from "@inertiajs/vue3";

const page = usePage();
const org_id = computed(() => page.props.org_id).value;

defineProps({
    job_postings: Array,
});
</script>

<style scoped>
.job-card {
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 16px;
    margin-bottom: 16px;
    background-color: #f9f9f9;
}

.view-btn {
    padding: 12px;
    border-radius: 6px;
    background-color: skyblue;
    text-decoration: none;
    color: white;
}
</style>
