<template>
    <h2 class="page-heading">Candidate</h2>

    <div>
        <Link :href="`/employees/${employee.id}/recruitment`" class="btn">
            Back To Recruitment
        </Link>
    </div>

    <div class="mt-2 mb-24">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Candidate Details</h3>
            <div>
                <AssignStatus
                    v-if="!candidate.status"
                    :job_applicant_id="candidate.id"
                />
                <div
                    v-if="candidate.status"
                    class="rounded-full text-center p-3 text-white"
                    :class="{
                        'bg-red-600': candidate.status === 'Rejected',
                        'bg-green-600': candidate.status === 'Offer',
                    }"
                >
                    {{ candidate.status }}
                </div>
            </div>
        </div>
        <div class="details-card">
            <div class="value">
                <span class="label">Name:</span> {{ candidate.name }}
            </div>
            <div class="value">
                <span class="label">Applied On:</span>{{ candidate.applied_on }}
            </div>
            <div class="value">
                <span class="label">Position:</span>{{ candidate.position }}
            </div>
            <div class="value">
                <span class="label">Email:</span>{{ candidate.email }}
            </div>
            <div class="value">
                <span class="label">Phone:</span>{{ candidate.phone }}
            </div>
            <div class="value">
                <span class="label">CV</span
                ><a :href="candidate.cv" target="_blank"> View CV </a>
            </div>
        </div>
    </div>
    <div class="mb-24">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Candidate Notes</h3>
            <Button
                class="action-btn hover:bg-[#ffb59a]"
                @click="visible = true"
                icon="pi pi-plus"
                label="Add Note"
            />
        </div>
        <div>
            <Dialog
                v-model="visible"
                :visible="visible"
                header="New Note"
                @update:visible="visible = $event"
            >
                <form class="space-y-4" @submit.prevent="saveNote">
                    <div class="flex flex-col">
                        <label for="notes">Note</label>
                        <Textarea
                            id="notes"
                            v-model="form.note"
                            rows="5"
                            cols="30"
                        />
                    </div>
                    <div>
                        <Button
                            class="action-btn"
                            label="Save"
                            icon="pi pi-save"
                            type="submit"
                            :disabled="form.processing"
                        />
                    </div>
                </form>
            </Dialog>
        </div>
        <div class="flex gap-x-4">
            <div v-for="note in candidate.notes" class="note-card">
                <div class="note">
                    {{ note.note }}
                </div>
                <div class="author">
                    {{ note.by }}
                </div>
            </div>
        </div>
    </div>

    <div>
        <div class="subsection">
            <h3 class="heading belgrano-regular">Interviews</h3>
            <div>
                <NewInterview
                    :interview_stages
                    :candidate_id="candidate.id"
                    v-if="!candidate.status"
                />
            </div>
        </div>
        <div class="interview-card gap-y-4" v-if="candidate.interviews.length">
            <div v-for="interview in candidate.interviews" :key="interview.id">
                <div class="interview-header">
                    <div class="time-header">
                        {{ interview.interview_on }} |
                        {{ interview.interview_at }}
                    </div>
                    <div>
                        <NewInterviewer
                            :employees
                            :interview_id="interview.id"
                        />
                    </div>
                </div>
                <div v-if="interview.interviewers.length">
                    <div class="interviewer-header">Interviewer(s):</div>
                    <div v-for="interviewer in interview.interviewers">
                        {{ interviewer.name }}
                    </div>
                </div>
                <div>
                    <div
                        class="feedback-header"
                        v-if="interview.feedbacks.length"
                    >
                        Feedback
                    </div>
                    <div v-for="feedback in interview.feedbacks" class="mb-2">
                        <div v-html="feedback.notes"></div>
                        <div
                            class="feedback-status bg-amber-500"
                            v-if="feedback.status === 'Maybe'"
                        >
                            {{ feedback.status }}
                        </div>
                        <div
                            class="feedback-status bg-red-600"
                            v-if="feedback.status === 'Strong No'"
                        >
                            {{ feedback.status }}
                        </div>
                        <div
                            class="feedback-status bg-red-400"
                            v-if="feedback.status === 'No'"
                        >
                            {{ feedback.status }}
                        </div>
                        <div
                            class="feedback-status bg-green-400"
                            v-if="feedback.status === 'Yes'"
                        >
                            {{ feedback.status }}
                        </div>
                        <div
                            class="feedback-status bg-green-600"
                            v-if="feedback.status === 'Strong Yes'"
                        >
                            {{ feedback.status }}
                        </div>
                        <Divider />
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { Link, usePage, useForm } from "@inertiajs/vue3";
import { computed, ref } from "vue";

import { Divider, Textarea, Dialog, Button } from "primevue";
import NewInterviewer from "./NewInterviewer.vue";
import NewInterview from "./NewInterview.vue";
import AssignStatus from "./AssignStatus.vue";

const page = usePage();
const employee = computed(() => page.props.employee);

const { candidate } = defineProps({
    candidate: Object,
    interview_stages: Array,
    employees: Array,
});

const form = useForm({
    note: "",
});

function saveNote() {
    form.post(`/job_applicants/${candidate.id}/candidate_notes`);
    visible.value = false;
    form.reset();
}

const visible = ref(false);
</script>

<style scoped>
.action-btn {
    background-color: orangered;
    border: none;
}

.details-card {
    .label {
        color: var(--color-slate-400);
        font-weight: 100;
    }

    .value {
        color: var(--color-slate-800);
        font-weight: 500;
    }

    border: 1px solid #ccc;
    border-radius: 8px;
    background-color: #f9f9f9;
    padding: 0.5rem;
    width: 25vw;
}

.subsection {
    display: flex;
    justify-content: space-between;
    align-items: baseline;
    padding: 0.5rem;
}

.note-card {
    border: 1px solid #ccc;
    border-radius: 8px;
    background-color: #f9f9f9;
    padding: 0.5rem;
    font-family: "Jura", sans-serif;
    font-weight: 400;
    font-size: 1.2rem;
    display: flex;
    flex-direction: column;
    width: 200px;

    .note {
        flex-basis: 90%;
    }

    .author {
        color: var(--color-amber-600);
        font-weight: 100;
        font-size: 1rem;
        flex-basis: 10%;
    }
}

.interview-card {
    border: 1px solid #ccc;
    border-radius: 8px;
    background-color: #f9f9f9;
    padding: 0.5rem;
    font-family: "Jura", sans-serif;
    font-weight: 400;
    font-size: 1.2rem;
    display: flex;
    flex-direction: column;

    .feedback-header {
        font-size: 1.5rem;
        font-weight: 500;
    }

    .interview-header {
        display: flex;
        justify-content: space-between;
    }

    .time-header {
        color: var(--color-amber-600);
        font-weight: 100;
    }

    .feedback-status {
        text-align: center;
        border-radius: 12px;
        margin-top: 1rem;
    }

    .interviewer-header {
        font-weight: lighter;
        color: var(--color-slate-400);
    }
}

.btn {
    text-decoration: none;
    background-color: lightgray;
    border: none;
}
</style>
