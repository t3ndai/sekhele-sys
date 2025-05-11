<template>
    <div>
        <h2 class="heading belgrano-regular">My Reports</h2>
        <div v-for="report in reports">
            <div class="report-card">
                <div class="name mb-7">
                    {{ report.name }}
                </div>
                <div class="flex gap-x-2">
                    <div>
                        <Link
                            :href="`/employees/${report.id}/one_to_ones`"
                            class="past-btn"
                        >
                            Past 1-1s
                        </Link>
                    </div>
                    <div>
                        <Link
                            :href="`/employees/${report.id}/one_to_ones/new`"
                            class="newOne-btn"
                        >
                            New 1-1
                        </Link>
                    </div>
                    <div>
                        <Link
                            :href="`/employees/${employee.id}/reports/${report.id}/goals`"
                            class="goals-btn"
                        >
                            View Goals
                        </Link>
                    </div>
                    <div>
                        <Link
                            :href="`/employees/${employee.id}/reports/${report.id}/career`"
                            class="career-btn"
                        >
                            Career
                        </Link>
                    </div>
                    <div>
                        <Link
                            :href="`/employees/${employee.id}/reports/${report.id}/new_performance_review`"
                            class="new-review-btn"
                        >
                            New Perfomance Review
                        </Link>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { Link } from "@inertiajs/vue3";
import { computed, ref } from "vue";
import { usePage } from "@inertiajs/vue3";
import Button from "primevue/button";

const page = usePage();
const employee = computed(() => page.props.employee);

defineProps({
    reports: Array,
});
</script>

<style scoped>
.report-card {
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 16px;
    margin-bottom: 16px;
    background-color: #f9f9f9;

    .name {
        font-size: 1.2rem;
        font-weight: bold;
        font-family: "Belgrano", sans-serif;
    }
}

.past-btn {
    padding: 12px;
    border-radius: 6px;
    background-color: var(--color-orange-300);
    text-decoration: none;
    color: white;
}

.newOne-btn {
    padding: 12px;
    border-radius: 6px;
    background-color: orangered;
    text-decoration: none;
    color: white;
}

.goals-btn {
    padding: 12px;
    border-radius: 6px;
    background-color: olive;
    text-decoration: none;
    color: white;
}

.career-btn {
    padding: 12px;
    border-radius: 6px;
    background-color: brown;
    text-decoration: none;
    color: white;
}

.new-review-btn {
    padding: 12px;
    border-radius: 6px;
    background-color: skyblue;
    text-decoration: none;
    color: white;
}
</style>
