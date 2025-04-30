<template>
    <Head>
        <title>Werk by Sekhele</title>
        <meta
            name="description"
            content="Werk by Sekhele is a platform to support HR & Finance Operations in the SADC Market i.e Zimbabwe, South Africa, Zambia, Mozambique, Malawi, Botswana, Namibia, Lesotho, Swaziland, Eswatini, and other countries in the region"
        />
    </Head>
    <div>
        <h1>Werk by Sekhele</h1>
        <p>
            Werk is your organization's Operating System to run your HR &
            Finance Operations
        </p>
        <p>
            We start with your most crucial asset which is your employees. Your
            employees are your engine, we are the oil that keeps your engine
            running smoothly.
        </p>
    </div>

    <div>
        <h2>Why Werk?</h2>
        <div>
            <p>
                Werk enables you align your employees with your company's goals
                through tools such as Tasks, Employee Goals,Milestones with
                deadlines.
            </p>
            <p>Big Picture Thinking. Big Results.</p>
        </div>
        <div>
            <img :src="arrows" />
        </div>
    </div>

    <div>
        <h2>Incentives & Compensation (Payroll)</h2>
        <p>
            Werk enables you to properly incentivize your employees to achieve
            your company's goals through Compensation (Payroll) - Job Levels,
            Compensation Bands, Benefits Management, Leave Management & Booking
            and Recognition tools.
        </p>
        <img :src="seedling" />
    </div>

    <div>
        <h2>Werk enables you to grow your company through your employees</h2>
        <div>
            by empowering your employees career growth & development through
            tools such as 1-1s, Career Development Plans, and Performance
            Reviews
        </div>
        <div>
            <img :src="target" />
        </div>
    </div>
</template>

<script setup>
import { Head } from "@inertiajs/vue3";
import arrows from "~/assets/images/arrows.jpg";
import seedling from "~/assets/images/seedling.jpg";
import target from "~/assets/images/target.jpg";
</script>
